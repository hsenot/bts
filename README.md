# bts

A set of data and scripts to analyze the load of the BTS (Brunswick Terminal Station).


# Context

The Brunswick Terminal Station upgrade has created conflict between the local community and the consortium of organisations delivering the project.
This work is intended to understand quantitatively the argument for the proposed upgrade, based on published data from the distributors.


The BTS is a wholesale supply point for 5 zone substations:

- Citipower-operated BK (Brunswick), C (Brunswick) and F (Fitzroy)
- Jemena-operated FF (Fairfield) and NS (North Essendon)


The subtransmission lines between the BTS and these zone substations are as follow:

- BK: BTS-BK185, BTS-BK187, BTS-BK194
- C: BTS-C186, BTS-C191, BTS-C196
- F: BTS-F179, BTS-F182, BTS-F189
- FF: BTS-FF1, BTS-FF2, BTS-FF3
- NS: BTS-NS1, BTS-NS2, BTS-NS3

[1] p100-101 and [2] p127 contain metrics around the capacity of these lines and utilisation scenarios (including outages).


# Structure of this repo

- data: source data from [3] and [4], and some wrangling around Jemena's data
- scripts: a set of PostgreSQL SQL commands to load/format/export the data
- output: some results

Note: at this stage, only the period 01/01/2014 to 30/06/2014 was considered, as it's the only period for which all substations data is complete. Prior to that, it's [a mess](https://twitter.com/hsenot/status/596514002873622528) on Citipower's side. Jemena's data is good albeit only available at 30mn resolution (versus 15mn resolution for Citipower's).


# Sources

Distribution Annual Planning Report:

[1] Citipower: https://www.powercor.com.au/media/2250/citipower-distribution-annual-planning-report-2014.pdf

[2] Jemena: http://jemena.com.au/getattachment/industry/electricity/Network-planning/2014-Distribution-Annual-Planning-Report.pdf.aspx/

Zone substation data - regulatory obligation as per [AEMC rule 2014 No.1](http://www.aemc.gov.au/getattachment/a975e95d-a935-4528-9984-60ccefbd59e1/Final-rule.aspx):

[3] Citipower: https://www.powercor.com.au/about-us/electricity-networks/zone-substation-reports/

[4] Jemena: http://jemena.com.au/industry/electricity/zone-substation-information/