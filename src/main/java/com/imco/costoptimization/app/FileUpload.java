package com.imco.costoptimization.app;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellType;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;


/**
 * Servlet implementation class FileUpload
 */
@WebServlet("/fileupload")
@MultipartConfig
public class FileUpload extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FileUpload() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
//		String yourName = request.getParameter("excelfile");
		response.setContentType("text/html;charset=UTF-8");

	    final Part filePart = request.getPart("excelfile");
	    final String fileName = getFileName(filePart);

	    OutputStream out = null;
	    InputStream filecontent = null;
	    final PrintWriter writer = response.getWriter();

	    try {
	        out = new FileOutputStream(new File(fileName));
	        filecontent = filePart.getInputStream();

	        int read = 0;
	        final byte[] bytes = new byte[1024];

	        while ((read = filecontent.read(bytes)) != -1) {
	            out.write(bytes, 0, read);
	        }
	        
	        //File myFile = new File(path + File.separator + fileName);
	        
	        //FileInputStream fis = new FileInputStream(myFile);
	        // Finds the workbook instance for XLSX file
	        XSSFWorkbook myWorkBook = new XSSFWorkbook (fileName);

	        // Return first sheet from the XLSX workbook
	        XSSFSheet mySheet = myWorkBook.getSheetAt(0);

	        // Get iterator to all the rows in current sheet
	        Iterator<Row> rowIterator = mySheet.iterator();
	        Map<String, List> uniqueClient = new HashMap<String, List>();
	      
//	        writer.println("<table >");
	        while (rowIterator.hasNext()) {
	        	  SummaryTableDataSet summaryTableOneRow=new SummaryTableDataSet();
	            Row row = rowIterator.next();
//	            writer.println("<tr>");
	            // For each row, iterate through each columns
	            Iterator<Cell> cellIterator = row.cellIterator();
	            double payg_1y=0.0;
	            double PAYG_3Y_t=0.0;
            	double ri_1y_PaygPrice=0.0;
            	double RI_3Y_PAYGPrice_t=0.0;
                double BreakEvenMonths_3YR_t=0.0;
            	double RI_3Y_Savings_PAYG_t=0.0;
            	double UnitPrice_PAYG_t =0.0;
	            while (cellIterator.hasNext()) {
//	            	writer.println("<td>");
	            	
	            	Cell cell = cellIterator.next();
	            	int cellindex = cell.getColumnIndex();
	                if(cellindex==0) {
	                	if (cell.getCellTypeEnum() == CellType.STRING) {
	                		summaryTableOneRow.setCustomerName(cell.getStringCellValue());
	                	}
	                }
	                if(cellindex==1) {
	                	if (cell.getCellTypeEnum() == CellType.STRING) {
	                		summaryTableOneRow.setSubscription(cell.getStringCellValue());
	                	}
	                }
	                if(cellindex==2) {
	                	if (cell.getCellTypeEnum() == CellType.STRING) {
	                		summaryTableOneRow.setMeterName(cell.getStringCellValue());
	                	}
	                }
	                if(cellindex==3) {
	                	if (cell.getCellTypeEnum() == CellType.STRING) {
	                		summaryTableOneRow.setMeterRegion(cell.getStringCellValue());
	                	}
	                }
	                if(cellindex==8) {
	                	if (cell.getCellTypeEnum() == CellType.STRING) {
	                		summaryTableOneRow.setResourceGroup(cell.getStringCellValue());
	                	}
	                }
	                if(cellindex==9) {
	                	if (cell.getCellTypeEnum() == CellType.STRING) {
	                		summaryTableOneRow.setInstanceId(cell.getStringCellValue());
	                	}
	                }
	                if(cellindex==16) {
	                	if (cell.getCellTypeEnum() == CellType.NUMERIC) {
	                		payg_1y=cell.getNumericCellValue();
	                		summaryTableOneRow.setPayG_1y(payg_1y);
	                	}
	                }
	                if(cellindex==19) {
	                	if (cell.getCellTypeEnum() == CellType.NUMERIC) {
	                		ri_1y_PaygPrice=cell.getNumericCellValue();
	                		summaryTableOneRow.setRi_1Y_PAYGPrice(ri_1y_PaygPrice);
	                	}
	                }
	               
	                if(cellindex==15) {
	                	if (cell.getCellTypeEnum() == CellType.NUMERIC) {
	                		UnitPrice_PAYG_t=cell.getNumericCellValue();
	                		summaryTableOneRow.setUnitPrice_PAYG(UnitPrice_PAYG_t);
	                		
	                	}
	                }
	                
	                if(cellindex==25) {
	                	if (cell.getCellTypeEnum() == CellType.NUMERIC) {
	                		PAYG_3Y_t=cell.getNumericCellValue();
	                		summaryTableOneRow.setPAYG_3Y(PAYG_3Y_t);
	                		
	                	}
	                }
	                
	                if(cellindex==28) {
	                	if (cell.getCellTypeEnum() == CellType.NUMERIC) {
	                		RI_3Y_PAYGPrice_t=cell.getNumericCellValue();
	                		summaryTableOneRow.setRI_3Y_PAYGPrice(RI_3Y_PAYGPrice_t);
	                	}
	                }
	                
	                if(cellindex==29) {
	                	if (cell.getCellTypeEnum() == CellType.NUMERIC) {
	                		RI_3Y_Savings_PAYG_t=cell.getNumericCellValue();
	                		summaryTableOneRow.setRI_3Y_Savings_PAYG(RI_3Y_Savings_PAYG_t);
	                	}
	                }
	                if(cellindex==33) {
	                	if (cell.getCellTypeEnum() == CellType.NUMERIC) {
	                		BreakEvenMonths_3YR_t=cell.getNumericCellValue();
	                		summaryTableOneRow.setBreakEvenMonths_3YR(BreakEvenMonths_3YR_t);
	                	}
	                }
	                summaryTableOneRow.setRi_1Y_Savings_PAYG(payg_1y-ri_1y_PaygPrice);
	                summaryTableOneRow.setBreakEvenMOnths_1YR(0.0);
	                
	                if (cell.getCellTypeEnum() == CellType.STRING) {
	                	//writer.print(cell.getStringCellValue());
	                } else if (cell.getCellTypeEnum() == CellType.NUMERIC) {
	                	//writer.print(cell.getNumericCellValue());
	                }
//	                writer.println("</td>");
	            }
	            //System.out.println(summaryTableOneRow.getCustomerName()+summaryTableOneRow.getMeterName());
	            List<SummaryTableDataSet> collectionofSameClient = null;
//	            writer.println("</tr>"); 
		         if(uniqueClient.containsKey(summaryTableOneRow.getCustomerName())) {
		        	 collectionofSameClient = (List)uniqueClient.get(summaryTableOneRow.getCustomerName());
		        	 
		         }else {
		        	 collectionofSameClient = new ArrayList<SummaryTableDataSet>();
		        	 
		         }
		         collectionofSameClient.add(summaryTableOneRow);
	        	 uniqueClient.put(summaryTableOneRow.getCustomerName(), collectionofSameClient);
	            
	        }
	        HttpSession session = request.getSession();
	        session.setAttribute("collectionObject", uniqueClient);
	        writer.println("<html><body><form action='showReportPerClient.jsp' method=\"post\">");
	        writer.println("<select id='customername'"+" name='customerName'>");
	        for(Map.Entry<String, List> entry : uniqueClient.entrySet()) {
	        	if(entry.getKey().equals("Customer"))
	        	{
	        		writer.println("<option value='"+entry.getKey()+"' selected>"+entry.getKey()+"</option>");
	        	}else {
	        		writer.println("<option value='"+entry.getKey()+"'>"+entry.getKey()+"</option>");
	        	}
	        }
	        writer.println("</select><button type=submit value=Submit>Show</button></form>");
	        
	    } catch (FileNotFoundException fne) {
	        writer.println("You either did not specify a file to upload or are "
	                + "trying to upload a file to a protected or nonexistent "
	                + "location.");
	        writer.println("<br/> ERROR: " + fne.getMessage());
	    } finally {
	        if (out != null) {
	            out.close();
	        }
	        if (filecontent != null) {
	            filecontent.close();
	        }
	        if (writer != null) {
	            writer.close();
	        }
	    }
	}
	
	private String getFileName(final Part part) {
	    final String partHeader = part.getHeader("content-disposition");
	    for (String content : part.getHeader("content-disposition").split(";")) {
	        if (content.trim().startsWith("filename")) {
	            return content.substring(
	                    content.indexOf('=') + 1).trim().replace("\"", "");
	        }
	    }
	    return null;
	}

}
