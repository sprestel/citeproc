Feature: collapse
  As a CSL cite processor hacker
  I want the test collapse_CitationNumberRangesWithAffixesNoCollapse to pass

  @citation @collapse
  Scenario: Citation Number Ranges With Affixes No Collapse
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
      <citation>
        <sort>
          <key variable="citation-number" />
        </sort>
        <layout delimiter="," font-weight="bold" prefix="(" suffix=")">
          <text prefix="[" suffix="]" variable="citation-number" />
        </layout>
      </citation>
    </style>
    """
    And the following input:
    """
    [{"id":"ITEM-1","title":"Paper 1","type":"book"},{"id":"ITEM-2","title":"Paper 2","type":"book"},{"id":"ITEM-3","title":"Paper 3","type":"book"}]
    """
    When I cite all items
    Then the result should be:
    """
    <b>([1],[2],[3])</b>
    """
