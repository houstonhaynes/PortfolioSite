+++
type = "itemized"
author = "Houston Haynes"
date = "2019-10-07"
title = "03. Early Data Science Experiments"
description = "Academic adventures combining music and machine learning"
featured = ""
featuredpath = ""
featuredalt = ""
categories = [""]
linktitle = ""
format = ""
link = ""
+++

In the early aughts I worked on the TherapyEdge®¹ application suite. By that time in my career I had already held several positions in development and project management. Having just completed a lead data analysis and compliance position at IBM, I was hired as the Manager of Verification and Validation at TherapyEdge – my first formal role in the quality assurance domain. The application was revolutionary in that it could provide an HIV patient’s medication regime recommendation in a few minutes of processing. Previously, an HIV specialist would take days or weeks to factor in all of the variables with test results and come up with an individual management program. One key to this system was a newly approved method for comparing genotype to phenotype testing – and deriving a “virtual phenotype” model that allowed a regimen to be calculated from the less time-consuming and less expensive genotype test. The other breakthrough was the system’s ability to assimilate and analyze large numbers of patient records to find the most fitting care recommendation for a given patient. The ultimate goal was to create a predictive construct that would help clinicians avoid medication resistance, conserve treatment options and by extension improve individual patient outcomes. This was my first encounter with “N-of-1” clinical trials and related fields of medical care and treatment. And from a technical view it was also a new perspective – this was big data aimed at making a big difference in people’s lives.

My role was both technical and regulatory in nature, and from that I had reporting lines to the head of software and the general counsel of the company. From those overlapping responsibilities I was tasked to lead a matrixed team of medical professionals and software (both development and test) engineers in creating a portion of a decision support system now called TherapyEval. The system ingested large catalogs of medication data curated by the team – both ARV and non-ARV formulations as well as over-the-counter drugs. We also created lists of food interaction and allergy/resistance information which could factor into a patient’s course of care. The technical portion of the system involved determining a correct and consistent scoring model for the type and level of interactions between medications that could be prescribed.

This meant looking at the combination and dosage of active ingredients, which was on a level of detail “below” the prescription itself. On the application side, the resulting calculations were presented as prescription KPIs (low, medium, and high indicators) to note patient risk for a given potential interaction. Along with that base functionality, there was a heavy reliance on medical reference and citation data that provided a justification for the resulting risk score. Also, the reference/citation data was presented through the application for clinician reference/review. Our group’s job was to analyze all of that incoming data, scrutinize each entry for correct data and citation information, and then produce an approved “canonical” record that could be ingested by the main decision engine. As new commercial and generic medications were introduced to the market, or new information was available on existing products and their active ingredients, the group would evaluate changes to the system and ensure that all regulatory and compliance obligations had been met as the changes were integrated into the system. As each version was completed, changes were noted in a management system that was then prepared for submission to governing regulatory agencies. In more recent years the governing bodies have built their own knowledge-bases that health care providers can access. Public APIs such as the one available from the National Institutes of Health supply researched and cited data that obviate the need for individual companies to compile this information. And non-profit initiatives like the HIV Response Database Initiative have taken on the burden of cross-compiling data and establishing a common model for predictive analytics that any care-giver can use. Even though I’m several years past that work, it’s still gratifying to see that similar systems are now part of established common practice. Wrangling those data sets was pains-taking work that required meticulous planning, team coordination and exacting delivery. But it was also among the most satisfying roles of my career.

Recently I have become re-acquainted with the term “N-of-1” – but not in the clinical sense. The term has been borrowed from that field and applied to personal health and fitness, and from that it has come into greater popular awareness. After a knee procedure in 2012 (I was struck by a car while driving my motorcycle) there was several months of rehab that ended up being a major turning point for my overall health. I needed to become stronger, particularly in the lower body. But I also really needed to become lighter. A big part of protecting my knees (I later developed a plica in my ‘good’ knee) was to simply take weight off of the joints. I had to find a balanced approach to simultaneously be more active while also taking off and keeping off the excess weight. Of course, the idea is to have an overall better health profile, so building and maintaining strength (both muscular and cardiovascular) was part of the balancing act. There’s certainly a way to reduce weight by simple calorie restriction, but that can have a negative effect on metabolism, and this can also impact sport/workout performance. Due to my own lack of education in this area, I used that approach for a while, and it didn’t work out so well. So already the N-of-1 methodology was in use, even if the result was undesirable. By the same token, there’s a way to measure workout intensity, but simply going full-tilt in the gym could risk re-injuring my knees (or some other part of my body) and has been found to be counter-productive to other parts of general health. Again, this is a place where I had some negative experience that required correction. So the goal now is to find that “Goldilocks zone” – balancing nutrition with training and recovery cycles to improve athletic performance while also enhancing the way I look and feel. That’s a pretty tall order, and not one that can be filled by simply “shooting from the hip” and hoping for the best. There would be many measure/analyze/correct cycles to make this work.

Like many other people I began measuring and monitoring what I ate by using a mobile app on my phone. I also tried various fitness trackers to gather daily activity and workout data. While it’s relatively straight-forward getting accurate nutritional tracking results from using an app like MyFitnessPal (as long as one is honest and consistent), the same cannot be said for fitness trackers. I’ll save the deep dive on this for the “health” portion of my site (coming soon), but anyone who has some familiarity with this area will know that the accuracy of those devices varies widely, and that’s perhaps being a bit too kind about it. One new device that caught my eye is the Bragi Dash wireless headphones. Not only do they have their own built-in music player, and water-proof housing for use while swimming – but it also has various sensors for activity tracking and monitoring. In most cases this is in the form of a heart rate monitor, but the Dash goes a step further by using a pulse oximeter. This not only can gather heart rate data, but also the level of oxygen saturation in the blood during exertion. I signed on to support their Kickstarter project as a developer, and am currently working with their initial API to gather and analyze that data. The app is simply entitled “Bragi RQ” and the intent is to create an inferential model of respiratory quotient monitoring based on oximetry (from the Dash) as a sole metric. This was inspired by the work of Dr. Peter Attia and his blog – Eating Academy. I will get into the details of the application on its portfolio page, but I will also be blogging about the development process – both on the software and hardware side of the equation.

Along with small-scale gathering and analysis of more accurate training data, I’m also looking at some of the big picture issues in overall personal health/activity monitoring. I’ve been surprised at the lack of sites/companies that help users analyze their nutrition, physical/body metrics and activity data as a whole. Perhaps Google Fit and Apple Health will approach that territory, as they would certainly be among the companies that would have access. But if either framework has those types of ambitions, I’ve seen no outward sign of them. They are collection points – and both have lots of X-Y plots of single data points over time – but they’re not doing anything ‘intelligent’ across sets of data. As much as general awareness is growing on the connections between nutrition and active lifestyle for overall health, there seems to be no real avenue for people to see those correlations in their personal data. In the spirit of N-of-1 clinical trials, I’m going to use myself as a first test subject. While I adopted wpDataTables and specifically their HighCharts implementation for this site, I will also be using that framework to visualize my personal fitness data. This will include pulling the information from the various sites that contain my data using their private and partner APIs – myFitnessPal, Withings, Polar, Bragi and others. From that I’ll create a consolidated semantic layer, and the follow-on charting and other visualizations will be displayed in the up-coming “health” portion of this site.