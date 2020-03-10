# Translating_Evidence_Into_Practice

The code associated with the research article, <em>Translating evidence into practice -- eligibility criteria fail to eliminate clinically significant differences between real-world and study populations.</em>

Thank for participating in this research project! This research investigates if and how observational cohorts subject to all eligibility criteria differ from the published randomized clinical trial data. In this study, we compare the published Baseline Demographics (Table 1) data from three Landmark clinical trials, ACCOMPLISH, RENAAL, and PROVE-IT and a safety trial that compares sitagliptin and glimepiride (NCT01189890) by [Hartley, et al](https://www.ncbi.nlm.nih.gov/pubmed/26041585) to the same estimates from observational cohorts constructed according to (i) the indication of the intervention alone, and (ii) the indication subject to all eligibility criteria put forth by the trial. If you would like to contribute to the network study of this research project -- to help us understand the reproducibility of both our results and that of the clinical trials we investigate -- please share your results with our study coordinator (email below).

Within the Study 2 folder (‘Studies’), there are four subfolders. You will need to run .R scripts in the folders entitled, ‘ACCOMPLISH’, ‘PROVE_IT’, ‘RENAAL,' and 'NCT01189890' during which, output will be saved in the fifth folder, ‘Results_To_Share’. 

To complete this study, collaborators should run scripts for ACCOMPLISH, PROVE-IT, RENAAL, and sitagliptin vs glimepiride. The four scripts must be run separately, but have the same instructions, which are given below.
<ol>
<li>To complete this study, collaborators only need to interact with the .R  file in each trials’ respective folder – ACCOMPLISH.R, PROVE_IT.R, RENAAL.R, and NCT01189890.R The /SQL files in each trials’ folder contain the .sql scripts that will be used to query your OHDSI instance. The .sql files  do not need further modification. </li>
<li>Within the .R script...</li>
<ol>
<li>Install packages if they are not already installed or load the library if they are already installed</li>
<ol>
<li>If the packages are not installed, highlight the lines of code that begin with ‘install.packages’ and ‘library’ and execute by clicking the ‘Run’ button in the upper right -hand corner of the console.</li>
<li>If the packages are installed, highlight only those lines of code that begin with ‘library’ and execute by clicking the ‘Run’ button in the upper right-hand corner of the console.</li>
</ol>
<li>Set working directory to the location of the /Study1 folder by changing the variable, ‘WorkingDir’.  To do this, change the placeholder path, "~/Desktop/Studies”, to the complete file path of the Studies folder on your local machine</li>
<li>Input your database information by changing the placeholder values in the .R script of the following variables, </li>
<ol>
<li>cdmDatabaseSchema. Change “public” to the name of the OHDSI schema</li>
<li>resultsDatabaseSchema. Enter the name of the schema that will hold data from this study</li>
<li>cdmVersion. Change “5” to  the version of the common data model of your OHDSI instance</li>
</ol>
<li>Input the connection details to the OHDSI instance in the connectionDetails function. To do this, enter values for variables in their empty placeholders,
<ol>
<li>dbms.  Enter the flavor of the SQL attached to your OHDSI database. Options include, "oracle", "postgresql", "pdw", "impala", "netezza”, "redshift"</li>
<li>user. Enter the username to access server.</li>
<li>password. Enter the password associated with that username.</li>
<li>port. Enter the port on the server to connect to.</li>
<li>server. Enter the name of the server.</li>
</ol>
<li>Run the trial by highlighting all of the code between “Creating Output Structure” and the end of the .R script and clicking the ‘Run’ button in the upper right-hand corner of the console.</li>
</ol>
<li>If you'd like to contribute to our network study, after all four trials have been run, zip the results folder, ‘Studies/Results_To_Share’ and email it to the study coordinator, Amelia J. Averitt at aja2149@cumc.columbia.edu</li>


If you encounter a bug or any other difficulty, please email Amelia J. Averitt at aja2149@cumc.columbia.edu
