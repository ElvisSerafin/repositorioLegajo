/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package conf;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import org.apache.commons.net.ftp.FTP;
import org.apache.commons.net.ftp.FTPClient;

/**
 *
 * @author Diego Arturo
 */
public class FTPConf {

    public static String server = "localhost";
    public static int port = 21;
    public static String user = "anonimo";
    public static String pass = "1234";
    public static String dir = "LegajoDocs/";
    

    public String subirArchivo(File archivo) {

        FTPClient ftpClient = new FTPClient();
        try {

            ftpClient.connect(server, port);
            ftpClient.login(user, pass);
            ftpClient.enterLocalPassiveMode();

            ftpClient.setFileType(FTP.BINARY_FILE_TYPE);

            // APPROACH #2: uploads second file using an OutputStream
            String serverFile = dir + archivo.getName();
            InputStream inputStream = new FileInputStream(archivo);

            OutputStream outputStream = ftpClient.storeFileStream(serverFile);
            byte[] bytesIn = new byte[4096];
            int read = 0;

            while ((read = inputStream.read(bytesIn)) != -1) {
                outputStream.write(bytesIn, 0, read);
            }
            inputStream.close();
            outputStream.close();
            
            boolean completed = ftpClient.completePendingCommand();
            if (completed) {
                String link="ftp://"+user+"@"+server+"/"+serverFile;
                return link;
            }

        } catch (IOException ex) {
            System.out.println("Error: " + ex.getMessage());
            ex.printStackTrace();
        } finally {
            try {
                if (ftpClient.isConnected()) {
                    ftpClient.logout();
                    ftpClient.disconnect();
                }
            } catch (IOException ex) {
                ex.printStackTrace();
            }
        }
        return null;
    }
    
    public static void main(String[] args) {
        FTPConf f= new FTPConf();
        File fi= new File("C://Users//Diego Arturo//Pictures//barra piso.png");
        System.out.println(f.subirArchivo(fi));
    }
}
