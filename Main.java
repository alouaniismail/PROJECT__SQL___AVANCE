import javax.swing.*;
import java.awt.*;
public class Main 
{
    public static void main(String[] args) 
    {
        // Définissez le frame
        JFrame frame = new JFrame("Parkings du campus");
        //L'en-têtes du JTable
        String[] column = {"Vehicules", "Stationnements", "Communes", "Parkings", "Positions"};
    
        //Les lignes du JTable
        String[][] data = {
	    {"...","...","...","...","..."}
        };
        
        // Créer le JTable
        JTable table = new JTable(data, column);
        JScrollPane scroll = new JScrollPane(table); 
        frame.add(scroll);
        frame.pack();
        frame.setSize(300, 200);
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.setVisible(true);
    }
}
