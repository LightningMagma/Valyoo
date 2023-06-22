<%-- 
    Document   : agregarPersonaRol
    Created on : Mar 22, 2023, 10:58:24 PM
    Author     : xJuanDa
--%>

<%@page import="ModeloVO.RolVO"%>
<%@page import="ModeloDAO.RolDAO"%>
<%@page import="ModeloVO.PersonaVO"%>
<%@page import="ModeloDAO.PersonaDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="Sesiones.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <link rel="icon" href="Estilos/logoValyoo.png">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Asignar Persona Rol</title>
        <link href="Estilos/Styles.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.1/themes/base/jquery-ui.css" />
        <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
        <script src="http://code.jquery.com/ui/1.10.1/jquery-ui.js"></script>
        <style>
            .ui-combobox {
                position: relative;
                display: inline-block;
            }
            .ui-combobox-toggle {
                position: absolute;
                top: 0;
                bottom: 0;
                margin-left: -1px;
                padding: 0;
                /* support: IE7 */                
            }
            .ui-combobox-input {
                margin: 0;
                padding: 0.3em;
            }
        </style>

    </head>
    <body>
        <h2>Asignación persona y rol</h2>
        <form method="post" action="PersonaRol">
            <div class="ui-widget">
                <label>Persona:</label>
                <select name="prPersona" id="combobox">
                    <option></option>
                    <%                    PersonaDAO perDAO = new PersonaDAO();
                        for (PersonaVO perVO : perDAO.listar()) {
                    %>
                    <option value="<%=perVO.getPerDocumento()%>"><%=perVO.getPerDocumento() + " Nombres: " + perVO.getPerNombre() + " " + perVO.getPerApellido()%></option>
                    <% } %>
                </select>
            </div>
            <div class="ui-widget">
                <label>Rol: </label>
                <select name="prRol" id="combobox">
                    <option>Seleccione...</option>
                    <%
                        RolDAO rolDAO = new RolDAO();
                        for (RolVO rolVO : rolDAO.listarRol()) {
                    %>
                    <option value="<%=rolVO.getRolId()%>"><%=rolVO.getRolNombre()%></option>
                    <% } %>
                </select>
            </div>
            <input type="submit" class="btn btn-success" value="Asignar rol">
            <input type="reset" class="btn btn-danger" value="Borrar">
            <a href="indexPersonaRol.jsp">
                <button class="btn btn-primary" type="button">Volver</button>
            </a>

            <input type="hidden" name="opcion" value="1">            
        </form>
        <%
            if (request.getAttribute("MensajeError") != null) { %>
        ${MensajeError}
        <%  } else { %>
        ${MensajeExito}
        <%  }
        %>
        <script>
            (function ($) {
                $.widget("ui.combobox", {
                    _create: function () {
                        var input,
                                that = this,
                                wasOpen = false,
                                select = this.element.hide(),
                                selected = select.children(":selected"),
                                value = selected.val() ? selected.text() : "",
                                wrapper = this.wrapper = $("<span>")
                                .addClass("ui-combobox")
                                .insertAfter(select);

                        function removeIfInvalid(element) {
                            var value = $(element).val(),
                                    matcher = new RegExp("^" + $.ui.autocomplete.escapeRegex(value) + "$", "i"),
                                    valid = false;
                            select.children("option").each(function () {
                                if ($(this).text().match(matcher)) {
                                    this.selected = valid = true;
                                    return false;
                                }
                            });

                            if (!valid) {
                                // remove invalid value, as it didn't match anything
                                $(element)
                                        .val("")
                                        .attr("title", value + " didn't match any item")
                                        .tooltip("open");
                                select.val("");
                                setTimeout(function () {
                                    input.tooltip("close").attr("title", "");
                                }, 2500);
                                input.data("ui-autocomplete").term = "";
                            }
                        }

                        input = $("<input>")
                                .appendTo(wrapper)
                                .val(value)
                                .attr("title", "")
                                .addClass("ui-state-default ui-combobox-input")
                                .autocomplete({
                                    delay: 0,
                                    minLength: 0,
                                    source: function (request, response) {
                                        var matcher = new RegExp($.ui.autocomplete.escapeRegex(request.term), "i");
                                        response(select.children("option").map(function () {
                                            var text = $(this).text();
                                            if (this.value && (!request.term || matcher.test(text)))
                                                return {
                                                    label: text.replace(
                                                            new RegExp(
                                                                    "(?![^&;]+;)(?!<[^<>]*)(" +
                                                                    $.ui.autocomplete.escapeRegex(request.term) +
                                                                    ")(?![^<>]*>)(?![^&;]+;)", "gi"
                                                                    ), "<strong>$1</strong>"),
                                                    value: text,
                                                    option: this
                                                };
                                        }));
                                    },
                                    select: function (event, ui) {
                                        ui.item.option.selected = true;
                                        that._trigger("selected", event, {
                                            item: ui.item.option
                                        });
                                    },
                                    change: function (event, ui) {
                                        if (!ui.item) {
                                            removeIfInvalid(this);
                                        }
                                    }
                                })
                                .addClass("ui-widget ui-widget-content ui-corner-left");

                        input.data("ui-autocomplete")._renderItem = function (ul, item) {
                            return $("<li>")
                                    .append("<a>" + item.label + "</a>")
                                    .appendTo(ul);
                        };

                        $("<a>")
                                .attr("tabIndex", -1)
                                .attr("title", "Show All Items")
                                .tooltip()
                                .appendTo(wrapper)
                                .button({
                                    icons: {
                                        primary: "ui-icon-triangle-1-s"
                                    },
                                    text: false
                                })
                                .removeClass("ui-corner-all")
                                .addClass("ui-corner-right ui-combobox-toggle")
                                .mousedown(function () {
                                    wasOpen = input.autocomplete("widget").is(":visible");
                                })
                                .click(function () {
                                    input.focus();

                                    // close if already visible
                                    if (wasOpen) {
                                        return;
                                    }

                                    // pass empty string as value to search for, displaying all results
                                    input.autocomplete("search", "");
                                });

                        input.tooltip({
                            tooltipClass: "ui-state-highlight"
                        });
                    },
                    _destroy: function () {
                        this.wrapper.remove();
                        this.element.show();
                    }
                });
            })(jQuery);

            $(function () {
                $("#combobox").combobox();
            });
        </script>
    </body>
</html>
