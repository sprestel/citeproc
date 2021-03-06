Feature: punctuation
  As a CSL cite processor hacker
  I want the test punctuation_DefaultYearSuffixDelimiter to pass

  @citation @punctuation @citations
  Scenario: Default Year Suffix Delimiter
    Given the following style:
    """
    <?xml version="1.0" encoding="utf-8"?>
    <style xmlns="http://purl.org/net/xbiblio/csl" class="in-text" version="1.0" demote-non-dropping-particle="sort-only">
      <info>
        <title>British Ecological Society Journals</title>
        <id>http://www.zotero.org/styles/besj</id>
        <link href="http://www.zotero.org/styles/besj" rel="self"/>
        <link href="http://www.functionalecology.org/view/0/authorGuideline.html" rel="documentation"/>
        <author>
          <name>Johan Asplund</name>
          <email>asplundj@gmail.com</email>
        </author>
        <contributor>
          <name> Sebastian Karcher</name>
        </contributor>
        <category field="biology"/>
        <category field="generic-base"/>
        <updated>2009-01-24T10:42:15+00:00</updated>
        <rights>This work is licensed under a Creative Commons Attribution-Share Alike 3.0 License: http://creativecommons.org/licenses/by-sa/3.0/</rights>
      </info>
      <macro name="editor-translator">
        <names variable="editor translator" prefix="(" suffix=")" delimiter=", ">
          <label form="short" suffix=" " text-case="lowercase" strip-periods="true"/>      
          <name and="text" initialize-with="" delimiter=", "/>
        </names>
      </macro>
      <macro name="author">
        <names variable="author">
          <name name-as-sort-order="all" and="symbol" sort-separator=", " initialize-with="." delimiter=", " delimiter-precedes-last="never"/>
          <label form="short" prefix=" (" suffix=")" text-case="lowercase" strip-periods="true"/>
          <substitute>
    		<names variable="editor"/>
    		<names variable="translator"/>
    		<text macro="title"/>
          </substitute>
        </names>
      </macro>
      <macro name="author-short">
        <names variable="author">
          <name form="short" and="symbol" delimiter=", " initialize-with=". "/>
          <et-al font-style="italic"/>
          <substitute>
    		<names variable="editor"/>
    		<names variable="translator"/>
    		<choose>
    		  <if type="bill book graphic legal_case motion_picture report song" match="any">
    			<text variable="title" form="short" font-style="italic"/>
    		  </if>
    		  <else>
    			<text variable="title" form="short" quotes="true"/>
    		  </else>
    		</choose>
          </substitute>
        </names>
      </macro>
      <macro name="title">
        <choose>
          <if type="bill book thesis graphic legal_case motion_picture report song" match="any">
    		<text variable="title" font-style="italic" text-case="title"/>
          </if>
          <else>
    		<text variable="title" text-case="title"/>
          </else>
        </choose>
      </macro>
      <macro name="edition">
        <choose>
          <if is-numeric="edition">
    		<group delimiter=" ">
    		  <number variable="edition" form="ordinal"/>
    		  <text term="edition" form="short" text-case="lowercase" strip-periods="true"/>
    		</group>
          </if>
          <else>
    		<text variable="edition"/>
          </else>
        </choose>
      </macro>
      <macro name="publisher">
        <group delimiter=", ">
          <text variable="genre"/>
          <text variable="publisher"/>
          <text variable="publisher-place"/>
        </group>
      </macro>
      <citation collapse="year-suffix" et-al-min="4" et-al-use-first="1" et-al-subsequent-min="3" et-al-subsequent-use-first="1" disambiguate-add-year-suffix="true" disambiguate-add-names="true">
        <sort>
          <key variable="issued"/>
          <key variable="author"/>
        </sort>
        <layout prefix="(" suffix=")" delimiter="; ">
          <group delimiter=" ">
    		<text macro="author-short"/>
    		<date variable="issued">
    		  <date-part name="year"/>
    		</date>
    		<group>
    		  <label variable="locator" suffix="." form="short" strip-periods="true"/>
    		  <text variable="locator" prefix=" "/>
    		</group>
          </group>
        </layout>
      </citation>
      <bibliography hanging-indent="true">
        <sort>
          <key macro="author-short"/>
          <key variable="issued"/>
        </sort>
        <layout>
          <text macro="author" suffix="."/>
          <date variable="issued" prefix=" (" suffix=")">
    		<date-part name="year"/>
          </date>
          <choose>
    		<if type="bill book thesis graphic legal_case motion_picture report song" match="any">
    		  <group suffix=".">
    			<text macro="title" prefix=" "/>
    			<text macro="edition" prefix=", "/>
    			<text macro="editor-translator" prefix=" "/>
    		  </group>
    		  <text prefix=" " suffix="." macro="publisher"/>
    		</if>
    		<else-if type="chapter paper-conference" match="any">
    		  <text macro="title" prefix=" "/>
    		  <group prefix=".">
    			<group prefix="" suffix="">
    			  <text variable="container-title" font-style="italic" prefix=" " suffix=""/>
    			  <text variable="collection-title" prefix=" " suffix="."/>
    			  <group suffix=".">
    				<text macro="edition" prefix=", "/>
    				<names variable="editor translator">
    				  <label form="short" prefix=" (" suffix=" " strip-periods="true"/>
    				  <name and="symbol" sort-separator=", " initialize-with="." delimiter=", " delimiter-precedes-last="never" suffix="),"/>
    				</names>
    				<label variable="page" form="short" prefix=" " suffix=". " strip-periods="true"/>
    				<text variable="page" suffix="."/>
    				<text macro="publisher" prefix=" "/>
    			  </group>
    			</group>
    		  </group>
    		</else-if>
    		<else-if type="webpage">
    		  <group prefix=" " delimiter=", ">
    			<text variable="title"/>
    			<text variable="URL"/>
    		  </group>
    		</else-if>
    		<else>
    		  <group suffix=".">
    			<text macro="title" prefix=" "/>
    			<text macro="editor-translator" prefix=" "/>
    		  </group>
    		  <group prefix=" " suffix=".">
    			<text variable="container-title" font-style="italic"/>
    			<group prefix=", ">
    			  <text variable="volume" font-weight="bold"/>
    			</group>
    			<text variable="page" prefix=", "/>
    		  </group>
    		</else>
          </choose>
        </layout>
      </bibliography>
    </style>

    """
    And the following input:
    """
    [{"author":[{"family":"Aalto","given":"Alan"}],"id":"ITEM-1","issued":{"date-parts":[[2000]]},"type":"book"},{"author":[{"family":"Aalto","given":"Alan"}],"id":"ITEM-2","issued":{"date-parts":[[2000]]},"type":"book"},{"author":[{"family":"Aalto","given":"Alan"}],"id":"ITEM-3","issued":{"date-parts":[[2000]]},"type":"book"}]
    """
    And I have a citations input
    When I cite all items
    Then the result should be:
    """
    >>[0] (Aalto 2000a; b; c)
    """
