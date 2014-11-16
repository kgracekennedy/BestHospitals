This are R functions that will help you determine you the "best" hospital for a given condition in a given state.  More information can be found in the pdf for instructions.

<b>Included Files</b>
<ul>
<li><b>Hospital_Revised_Flatfiles.pdf</b>: This file includes information about the datasets that are available, including hospital-data.csv and outcome-of-care-measures.csv, which are included in this repository.</li>
<li><b>hospital-data.csv</b>: This csv includes general information about the hospitals.</li>
<li><b>outcome-of-care-measures.csv</b>: This csv includes specific data about the hospital's performance on patients by sickness.</li>
<li><b>plothospitals.R</b>: A quick peek at heart attach data about the thirty day mortality rate.</li>
<li><b>Instructions.pdf</b>: Instructions for the project.  In includes some sample output to check if code is working.</li>
<li><b>plothospitals.R</b>: A quick peek at heart attach data for thirty day mortality rate.</li>
<li><b>best.R</b>: This function reads the data from outcome-of-care-measures.csv and returns the best hospital in a given state by 30 day survival for a specific sickness (heart attack, heart failure, pneumonia).</li>
<li><b>rankhospital.R</b>: This function reads the data from outcome-of-care-measures.csv and returns the nth best hospital in a state for a given sickness (heart attack, heart failure, pneumonia).  If a specific ranking is not given, rankhospital() assumes that the user would like the best hospital.  Ties are settled by alphabetical order.</li>
<li><b>rankall.R</b>: This function reads the data from outcome-of-care-measures.csv and returns a data frame with the nth best hospital in each state for a given sickness (heart attack, heart failure, pneumonia) along with the state.  Ties are handled the same way as for rankhospital.R.</li>
</ul>

Future work: It is my intent to generalize this code so it can take in more sicknesses and make it available on my website.
