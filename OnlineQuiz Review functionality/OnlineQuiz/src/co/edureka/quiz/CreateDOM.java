package co.edureka.quiz;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.net.URISyntaxException;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.w3c.dom.Document;
import org.xml.sax.SAXException;

public class CreateDOM {

	public static Document getDOM(String test)
			throws SAXException, ParserConfigurationException, IOException, URISyntaxException {
		Document dom = null;
		File quizFile = null;

		quizFile = new File(
				"/home/user/demo/exercices/creating-a-quiz-application-code/OnlineQuiz Review functionality/OnlineQuiz/Quizzes/"
						+ "java-quiz-1.xml");
		System.out.println("Quiz File Absolute Path " + quizFile.getAbsolutePath());

		DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
		DocumentBuilder db = dbf.newDocumentBuilder();
		try {
			dom = db.parse(quizFile);
		} catch (FileNotFoundException fileNotFound) {
			System.out.println("Error : Quiz File Not Found " + fileNotFound);
		}
		dom.getDocumentElement().normalize();
		return dom;
	}

}
