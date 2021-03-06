Feature: disambiguate
  As a CSL cite processor hacker
  I want the test disambiguate_YearSuffixTwoPairsFirstNameBibliography to pass

  @bibliography @disambiguate
  Scenario: Year Suffix Two Pairs First Name Bibliography
    Given the following style:
    """
    <style 
          xmlns="http://purl.org/net/xbiblio/csl"
          class="in-text"
          version="1.0">
      <info>
        <id />
        <title />
        <updated>2011-06-10T04:49:00+09:00</updated>
      </info>
      <macro name="date">
        <date variable="issued">
          <date-part name="year" />
        </date>
        <text variable="year-suffix" />
      </macro>
      <macro name="author">
        <names variable="author">
          <name delimiter=", " initialize-with=". " and="text"/>
        </names>
      </macro>
      <citation 
             et-al-min="3"
             et-al-use-first="1"
             disambiguate-add-year-suffix="true">
        <layout>
          <names variable="author">
            <name initialize-with="."/>
          </names>
          <date form="text" date-parts="year" variable="issued"/>
        </layout>
      </citation>
      <bibliography>
        <sort>
          <key macro="author"/>
          <key macro="date" />
        </sort>
        <layout>
          <text macro="author" suffix=", "/>
          <text macro="date"/>
        </layout>
      </bibliography>
    </style>
    """
    And the following input:
    """
    [{"author":[{"family":"Doe","given":"John"},{"family":"Jones","given":"Sarah"}],"id":"suffix1","issued":{"date-parts":[["1999"]]},"title":"Book A","type":"book"},{"author":[{"family":"Doe","given":"James"},{"family":"Jones","given":"Steven"}],"id":"suffix2","issued":{"date-parts":[["1999"]]},"title":"Book B","type":"book"},{"author":[{"family":"Doe","given":"Jake"},{"family":"Smith","given":"Stan"}],"id":"suffix3","issued":{"date-parts":[["1999"]]},"title":"Book C","type":"book"},{"author":[{"family":"Doe","given":"Jasper"},{"family":"Smith","given":"Sandra"}],"id":"suffix4","issued":{"date-parts":[["1999"]]},"title":"Book D","type":"book"}]
    """
    When I render the entire bibliography
    Then the bibliography should be:
    """
    <div class="csl-bib-body">
      <div class="csl-entry">J. Doe and S. Jones, 1999a</div>
      <div class="csl-entry">J. Doe and S. Jones, 1999b</div>
      <div class="csl-entry">J. Doe and S. Smith, 1999a</div>
      <div class="csl-entry">J. Doe and S. Smith, 1999b</div>
    </div>
    """
