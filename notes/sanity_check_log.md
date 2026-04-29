## Query: Average resolution time by agency (2026-03-27)

- **File:** sql/resolution_time.sql
- **Business question:** How long does each agency take to resolve complaints?
- **What I expected:** Agencies handling complex housing or infrastructure complaints would likely take longer on average than agencies with more routine cases.
- **Issues encountered:** The complaint dates are stored as strings, so the query had to parse `created_date` and `closed_date` before calculating the day difference. I also had to be careful about open complaints with missing `closed_date` values.
- **Checks performed:** I checked that the date format was being parsed correctly, grouped the results by agency, and sorted the output from longest to shortest average resolution time. I also reviewed the results to make sure they looked reasonable.
- **Final outcome:** The query gives a reasonable agency-level ranking of average resolution times. It is useful for a stakeholder summary, but a good next step would be to clearly exclude open complaints or report them separately.
- **Confidence:** High. Would present to stakeholder.