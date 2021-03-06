Feature: magic
  As a CSL cite processor hacker
  I want the test magic_PunctuationInQuoteNested to pass

  @citation @magic
  Scenario: Punctuation In Quote Nested
    Given the following style:
    """
    <style 
          xmlns="http://purl.org/net/xbiblio/csl"
          class="note"
          version="1.0">
      <info>
        <id />
        <title />
        <updated>2009-08-10T04:49:00+09:00</updated>
      </info>
      <locale xml:lang="en">
        <style-options punctuation-in-quote="true" />
      </locale>
      <macro name="mytitle">
        <group font-style="italic">
          <text quotes="true" variable="title" />
        </group>
      </macro>
      <citation>
        <layout suffix=".">
          <names suffix=". " variable="author">
            <name form="short" />
          </names>
          <text macro="mytitle"/>
          <date variable="issued" prefix=". ">
            <date-part name="year" />
          </date>
        </layout>
      </citation>
    </style>
    """
    And the following input:
    """
    [{"author":[{"family":"Doe","given":"John","static-ordering":false}],"id":"ITEM-1","issued":{"date-parts":[[1900]]},"title":"Book A","type":"book"}]
    """
    When I cite all items
    Then the result should be:
    """
    Doe. <i>“Book A.”</i> 1900.
    """
