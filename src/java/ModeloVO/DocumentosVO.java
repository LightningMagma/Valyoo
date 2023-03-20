/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ModeloVO;

/**
 *
 * @author ACER
 */
public class DocumentosVO {
    private String docId,docNombre,docUrl,docPer;

    public DocumentosVO() {}

    public DocumentosVO(String docId, String docNombre, String docUrl, String docPer) {
        this.docId = docId;
        this.docNombre = docNombre;
        this.docUrl = docUrl;
        this.docPer = docPer;
    }

    public String getDocId() {
        return docId;
    }

    public void setDocId(String docId) {
        this.docId = docId;
    }

    public String getDocNombre() {
        return docNombre;
    }

    public void setDocNombre(String docNombre) {
        this.docNombre = docNombre;
    }

    public String getDocUrl() {
        return docUrl;
    }

    public void setDocUrl(String docUrl) {
        this.docUrl = docUrl;
    }

    public String getDocPer() {
        return docPer;
    }

    public void setDocPer(String docPer) {
        this.docPer = docPer;
    }
    
}
