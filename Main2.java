import javax.swing.*;
import java.awt.*;
public class Main2
{
    public static void main(String[] args) 
    {
        // Définissez le frame
        JFrame frame = new JFrame("Graphisme (Parkings_campus)");
        JPanel panel = new JPanel();
         
        // Définir le menu principal
        JMenuBar menu = new JMenuBar();
        JMenu file = new JMenu("Fichier");
        JMenu edit = new JMenu("Other_cmds");
        JMenu help = new JMenu("Aide");
         
        // Définir le sous-menu pour Fichier
        JMenuItem newf = new JMenuItem("Insertion/Updating");
        JMenuItem quit = new JMenuItem("Consultations (s/vues)");
        JMenuItem save = new JMenuItem("Enregistrer");
 
        file.add(newf);
        file.add(save);
        file.add(quit);
         
        menu.add(file);
        menu.add(edit);
        menu.add(help);
         
        frame.setLayout(new GridLayout(5, 1));
    
        frame.add(menu);
        frame.add(panel);
        frame.pack();
        frame.setSize(300, 200);
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.setVisible(true);
    }
}
