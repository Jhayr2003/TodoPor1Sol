package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Modelo.Usuario;
import DAO.DAOusuario;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.net.URL;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletOutputStream;
import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.IndexedColors;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;


import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import org.apache.commons.compress.utils.IOUtils;
import org.apache.poi.ss.usermodel.ClientAnchor.AnchorType;
import org.apache.poi.xssf.usermodel.XSSFColor;


@WebServlet(name = "SvUsuario", urlPatterns = {"/SvUsuario"})
public class SvUsuario extends HttpServlet {
    String listar="pages/admin/NuevoUsuario.jsp";
    Usuario usuario = new Usuario();
    DAOusuario dao = new DAOusuario();

    public void LeerDatosUsuario(HttpServletRequest request, HttpServletResponse response) {
        try {
            usuario.setDniEmpleado(request.getParameter("dniEmpleado"));
            usuario.setNombre(request.getParameter("nombre"));
            usuario.setClave(request.getParameter("clave"));
            
            // Logging para depurar
            System.out.println("LeerDatosUsuario - dniEmpleado: " + usuario.getDniEmpleado());
            System.out.println("LeerDatosUsuario - nombre: " + usuario.getNombre());
            System.out.println("LeerDatosUsuario - clave: " + usuario.getClave());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String action = request.getParameter("accion");
        
        // Logging para depurar
        System.out.println("processRequest - action: " + action);

        switch (action) {
            case "agregar":
                LeerDatosUsuario(request, response);
                dao.Insert(usuario);
                response.sendRedirect(listar);
                break;

            case "actualizar":
                LeerDatosUsuario(request, response);
                dao.Update(usuario);
                response.sendRedirect(listar);
                break;

            case "eliminar":
                String dni = request.getParameter("dniEmpleado");
                
                // Logging para depurar
                System.out.println("processRequest - eliminar - dni: " + dni);

                dao.Delete(dni);
                response.sendRedirect(listar);
                break;
                
            case "exportarExcel":
                exportToExcel(response);
                return; // Salir del método después de exportar

            default:
                response.sendRedirect(listar);
                break;
        }
    }
    

 
protected void exportToExcel(HttpServletResponse response) throws IOException {
    response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
    response.setHeader("Content-Disposition", "attachment; filename=ReporteUsuarios.xlsx");

    Workbook workbook = new XSSFWorkbook();
    Sheet sheet = workbook.createSheet("Usuarios");

    // Cargar la imagen del logo
    String logoURL = "https://www.sysfarmasoluciones.com/simbolo_sysfarma.png";
    InputStream is = new URL(logoURL).openStream();
    byte[] bytes = IOUtils.toByteArray(is);
    is.close();

    int logoHeight = 80; // Altura de la imagen
    int logoWidth = 63; // Ancho de la imagen
    int pictureIdx = workbook.addPicture(bytes, Workbook.PICTURE_TYPE_PNG);
    CreationHelper helper = workbook.getCreationHelper();
    Drawing<?> drawing = sheet.createDrawingPatriarch();
    ClientAnchor anchor = helper.createClientAnchor();
    anchor.setCol1(0);
    anchor.setRow1(0);
    anchor.setCol2(1);
    anchor.setRow2(4);

    // Crear la imagen y ajustar tamaño
    Picture pict = drawing.createPicture(anchor, pictureIdx);
    pict.resize(1.0, 1.0); // Redimensionar al tamaño original de la imagen
    pict.resize(logoWidth / pict.getImageDimension().getWidth(), logoHeight / pict.getImageDimension().getHeight());

    // Estilos
    CellStyle headerStyle = workbook.createCellStyle();
    headerStyle.setFillForegroundColor(new XSSFColor(new java.awt.Color(207, 226, 255), null));
    headerStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);
    headerStyle.setBorderBottom(BorderStyle.THIN);
    headerStyle.setBorderTop(BorderStyle.THIN);
    headerStyle.setBorderRight(BorderStyle.THIN);
    headerStyle.setBorderLeft(BorderStyle.THIN);
    headerStyle.setAlignment(HorizontalAlignment.CENTER);
    Font headerFont = workbook.createFont();
    headerFont.setBold(true);
    headerFont.setColor(IndexedColors.BLACK.getIndex());
    headerStyle.setFont(headerFont);
    
    //´Estilo del titulo
    CellStyle titleStyle = workbook.createCellStyle();
    titleStyle.setAlignment(HorizontalAlignment.CENTER);
    titleStyle.setFillForegroundColor(IndexedColors.AQUA.getIndex());
    titleStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);

    Font titleFont = workbook.createFont();
    titleFont.setBold(true);
    titleFont.setColor(IndexedColors.BLACK.getIndex());
    titleFont.setFontHeightInPoints((short) 16);
    titleStyle.setFont(titleFont);

    CellStyle cellStyle = workbook.createCellStyle();
    cellStyle.setBorderBottom(BorderStyle.THIN);
    cellStyle.setBorderTop(BorderStyle.THIN);
    cellStyle.setBorderRight(BorderStyle.THIN);
    cellStyle.setBorderLeft(BorderStyle.THIN);
    cellStyle.setAlignment(HorizontalAlignment.CENTER);

    // Estilo para la información de la empresa
    CellStyle infoStyle = workbook.createCellStyle();
    infoStyle.setFillForegroundColor(new XSSFColor(new java.awt.Color(207, 226, 255), null));
    infoStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);
    infoStyle.setBorderBottom(BorderStyle.THIN);
    infoStyle.setBorderTop(BorderStyle.THIN);
    infoStyle.setBorderRight(BorderStyle.THIN);
    infoStyle.setBorderLeft(BorderStyle.THIN);
    infoStyle.setAlignment(HorizontalAlignment.LEFT);

    // Información de la empresa
    String[][] empresaInfo = {
        {"Empresa :", "Todo Por 1 Sol"},
        {"RUC :", "20603841108"},
        {"Dirección :", "Jr. Jose Carlos Mariategui Nro. 299a"},
        {"Correo :", "TodoPor1Sol@gmail.com"},
        {"Fecha y Hora de impresión :", LocalDateTime.now().format(DateTimeFormatter.ofPattern("dd MMMM yyyy HH:mm"))},
        {"Teléfono :", "981770647"}
    };

    // Agregar información de la empresa
    int rowIndex = 0;
    for (String[] info : empresaInfo) {
        Row row = sheet.createRow(rowIndex++);
        Cell cell1 = row.createCell(1);
        Cell cell2 = row.createCell(2);
        cell1.setCellValue(info[0]);
        cell2.setCellValue(info[1]);
        cell1.setCellStyle(infoStyle);
        cell2.setCellStyle(infoStyle);
    }

    // Crear fila de título
    Row titleRow = sheet.createRow(rowIndex++);
    Cell titleCell = titleRow.createCell(0);
    titleCell.setCellValue("REPORTE DE USUARIOS - TODO POR 1 SOL");
    titleCell.setCellStyle(titleStyle);
    sheet.addMergedRegion(new CellRangeAddress(titleRow.getRowNum(), titleRow.getRowNum(), 0, 2));

    // Crear encabezados
    Row headerRow = sheet.createRow(rowIndex++);
    String[] headers = {"DNI", "Nombre", "Clave"};
    for (int i = 0; i < headers.length; i++) {
        Cell cell = headerRow.createCell(i);
        cell.setCellValue(headers[i]);
        cell.setCellStyle(headerStyle);
    }

    // Agregar datos
    ArrayList<Usuario> listaUsuarios = dao.ListarUsuario();
    for (int i = 0; i < listaUsuarios.size(); i++) {
        Usuario u = listaUsuarios.get(i);
        Row row = sheet.createRow(rowIndex++);
        row.createCell(0).setCellValue(u.getDniEmpleado());
        row.createCell(1).setCellValue(u.getNombre());
        row.createCell(2).setCellValue(u.getClave());

        // Aplicar estilo a las celdas
        for (int j = 0; j < headers.length; j++) {
            row.getCell(j).setCellStyle(cellStyle);
        }
    }

    // Ajustar el ancho de las columnas
    sheet.setColumnWidth(0, 30 * 256); // DNI
    sheet.setColumnWidth(1, 50 * 256); // Nombre
    sheet.setColumnWidth(2, 30 * 256); // Clave

    // Escribir el archivo
    try (ServletOutputStream out = response.getOutputStream()) {
        workbook.write(out);
    }
}

   

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}


