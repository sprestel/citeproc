Feature: bugreports
  As a CSL cite processor hacker
  I want the test bugreports_TwoCitesPlusOneBackref to pass

  @citation @bugreports @citations
  Scenario: Two Cites Plus One Backref
    Given the following style:
    """
    <style
           xmlns="http://purl.org/net/xbiblio/csl"
          class="note"
          version="1.1mlz1"
          page-range-format="chicago"
          default-locale="en-US-x-sort-ja-alalc97-x-sec-en-x-pri-ja-alalc97">
      <info>
        <title>Bluebook (demo)</title>
        <id>http://www.zotero.org/styles/bluebook-demo</id>
        <link rel="self" href="http://www.zotero.org/styles/bluebook-demo" />
        <link href="http://www.legalbluebook.com/" rel="documentation" />
        <author>
          <name>Frank Bennett</name>
          <email>biercenator@gmail.com</email>
        </author>
        <summary>Bluebook Style for legal materials</summary>
        <category field="generic-base" />
        <category citation-format="numeric" />
        <updated>2010-04-24T04:49:00+09:00</updated>
      </info>
      <locale>
    	<terms>
    	  <term name="ibid">id.</term>
    	</terms>
      </locale>
    
      <!-- ### CHICAGO FULLNOTE WITH BIBLIOGRAPHY (mainstream) ### -->
      <macro name="editor-translator">
        <group delimiter=", ">
          <choose>
            <if variable="author">
              <names delimiter=", " variable="editor">
                <label form="verb-short" suffix=". " text-case="lowercase" />
                <name and="text" delimiter=", " />
              </names>
            </if>
          </choose>
          <choose>
            <if match="any" variable="author editor">
              <names delimiter=", " variable="translator">
                <label form="verb-short" suffix=". " text-case="lowercase" />
                <name and="text" delimiter=", " />
              </names>
            </if>
          </choose>
        </group>
      </macro>
      <macro name="secondary-contributors-note">
        <choose>
          <if match="none" type="chapter">
            <text macro="editor-translator" />
          </if>
        </choose>
      </macro>
      <macro name="container-contributors-note">
        <choose>
          <if type="chapter">
            <text macro="editor-translator" />
          </if>
        </choose>
      </macro>
      <macro name="secondary-contributors">
        <choose>
          <if match="none" type="chapter">
            <group delimiter=". ">
              <choose>
                <if variable="author">
                  <names delimiter=". " variable="editor">
                    <label form="verb" prefix=" " suffix=" " text-case="capitalize-first" />
                    <name and="text" delimiter=", " />
                  </names>
                </if>
              </choose>
              <choose>
                <if match="any" variable="author editor">
                  <names delimiter=". " variable="translator">
                    <label form="verb" prefix=" " suffix=" " text-case="capitalize-first" />
                    <name and="text" delimiter=", " />
                  </names>
                </if>
              </choose>
            </group>
          </if>
        </choose>
      </macro>
      <macro name="container-contributors">
        <choose>
          <if type="chapter">
            <group delimiter=", ">
              <choose>
                <if variable="author">
                  <names delimiter=", " variable="editor">
                    <label form="verb" suffix=" " text-case="lowercase" />
                    <name and="text" delimiter=", " />
                  </names>
                </if>
              </choose>
              <choose>
                <if match="any" variable="author editor">
                  <names delimiter=", " variable="translator">
                    <label form="verb" suffix=" " text-case="lowercase" />
                    <name and="text" delimiter=", " />
                  </names>
                </if>
              </choose>
            </group>
          </if>
        </choose>
      </macro>
      <macro name="editor-note">
        <names variable="editor">
          <name and="text" delimiter=", " sort-separator=", " />
          <label form="short" prefix=", " suffix="." />
        </names>
      </macro>
      <macro name="translator-note">
        <names variable="translator">
          <name and="text" delimiter=", " sort-separator=", " />
          <label form="verb-short" prefix=", " suffix="." />
        </names>
      </macro>
      <macro name="recipient-note">
        <names delimiter=", " variable="recipient">
          <label form="verb" prefix=" " suffix=" " text-case="lowercase" />
          <name and="text" delimiter=", " />
        </names>
      </macro>
      <macro name="contributors-note">
        <names variable="author">
          <name and="text" delimiter=", " sort-separator=", " />
          <substitute>
            <text macro="editor-note" />
            <text macro="translator-note" />
          </substitute>
        </names>
        <text macro="recipient-note" />
      </macro>
      <macro name="editor">
        <names variable="editor">
          <name and="text" delimiter=", " delimiter-precedes-last="always" name-as-sort-order="first" sort-separator=", " />
          <label form="short" prefix=", " suffix="." />
        </names>
      </macro>
      <macro name="translator">
        <names variable="translator">
          <name and="text" delimiter=", " delimiter-precedes-last="always" name-as-sort-order="first" sort-separator=", " />
          <label form="verb-short" prefix=", " suffix="." />
        </names>
      </macro>
      <macro name="recipient">
        <choose>
          <if type="personal_communication">
            <choose>
              <if variable="genre">
                <text text-case="capitalize-first" variable="genre" />
              </if>
              <else>
                <text term="letter" text-case="capitalize-first" />
              </else>
            </choose>
          </if>
        </choose>
        <text macro="recipient-note" prefix=" " />
      </macro>
      <macro name="contributors">
        <names variable="author">
          <name and="text" delimiter=", " delimiter-precedes-last="always" name-as-sort-order="first" sort-separator=", " />
          <substitute>
            <text macro="editor" />
            <text macro="translator" />
          </substitute>
        </names>
        <text macro="recipient" prefix=". " />
      </macro>
      <macro name="recipient-short">
        <names variable="recipient">
          <label form="verb" prefix=" " suffix=" " text-case="lowercase" />
          <name and="text" delimiter=", " form="short" />
        </names>
      </macro>
      <macro name="contributors-short">
        <names variable="author">
          <name and="text" delimiter=", " form="short" />
          <substitute>
            <names variable="editor" />
            <names variable="translator" />
          </substitute>
        </names>
        <text macro="recipient-short" />
      </macro>
      <macro name="contributors-sort">
        <names variable="author">
          <name and="text" delimiter=", " delimiter-precedes-last="always" name-as-sort-order="all" sort-separator=", " />
          <label form="verb-short" prefix=", " suffix="." />
          <substitute>
            <names variable="editor" />
            <names variable="translator" />
          </substitute>
        </names>
      </macro>
      <macro name="interviewer-note">
        <names delimiter=", " variable="interviewer">
          <label form="verb" prefix=" " suffix=" " text-case="lowercase" />
          <name and="text" delimiter=", " />
        </names>
      </macro>
      <macro name="interviewer">
        <names delimiter=", " variable="interviewer">
          <label form="verb" prefix=" " suffix=" " text-case="capitalize-first" />
          <name and="text" delimiter=", " />
        </names>
      </macro>
      <macro name="title-note">
        <choose>
          <if match="none" variable="title">
            <text variable="genre" />
          </if>
          <else-if type="book">
            <text font-style="italic" variable="title" />
          </else-if>
          <else>
            <text quotes="true" variable="title" />
          </else>
        </choose>
      </macro>
      <macro name="title">
        <choose>
          <if match="none" variable="title">
            <choose>
              <if match="none" type="personal_communication">
                <text text-case="capitalize-first" variable="genre" />
              </if>
            </choose>
          </if>
          <else-if type="book">
            <text font-style="italic" variable="title" />
          </else-if>
          <else>
            <text quotes="true" variable="title" />
          </else>
        </choose>
      </macro>
      <macro name="title-short">
        <choose>
          <if match="none" variable="title">
            <choose>
              <if type="interview">
                <text term="interview" text-case="lowercase" />
              </if>
              <else-if match="any" type="manuscript speech">
                <text form="short" variable="genre" />
              </else-if>
              <else-if type="personal_communication">
                <text macro="issued" />
              </else-if>
            </choose>
          </if>
          <else-if type="book">
            <text font-style="italic" form="short" variable="title" />
          </else-if>
          <else>
            <text form="short" quotes="true" variable="title" />
          </else>
        </choose>
      </macro>
      <macro name="description-note">
        <group delimiter=", ">
          <text macro="interviewer-note" />
          <text variable="medium" />
          <choose>
            <if match="none" variable="title"> </if>
            <else-if match="any" type="thesis speech"> </else-if>
            <else>
              <text variable="genre" />
            </else>
          </choose>
        </group>
      </macro>
      <macro name="description">
        <group delimiter=", ">
          <group delimiter=". ">
            <text macro="interviewer" />
            <text text-case="capitalize-first" variable="medium" />
          </group>
          <choose>
            <if match="none" variable="title"> </if>
            <else-if match="any" type="thesis speech"> </else-if>
            <else>
              <text text-case="capitalize-first" variable="genre" />
            </else>
          </choose>
        </group>
      </macro>
      <macro name="container-title-note">
        <choose>
          <if type="chapter">
            <text suffix=" " term="in" text-case="lowercase" />
          </if>
        </choose>
        <text font-style="italic" variable="container-title" />
      </macro>
      <macro name="container-title">
        <choose>
          <if type="chapter">
            <text suffix=" " term="in" text-case="capitalize-first" />
          </if>
        </choose>
        <text font-style="italic" variable="container-title" />
      </macro>
      <macro name="collection-title">
        <text variable="collection-title" />
        <text prefix=" " variable="collection-number" />
      </macro>
      <macro name="edition-note">
        <choose>
          <if match="any" type="book chapter">
            <choose>
              <if is-numeric="edition">
                <group delimiter=" ">
                  <number form="ordinal" variable="edition" />
                  <text form="short" suffix="." term="edition" />
                </group>
              </if>
              <else>
                <text suffix="." variable="edition" />
              </else>
            </choose>
          </if>
        </choose>
      </macro>
      <macro name="edition">
        <choose>
          <if match="any" type="book chapter">
            <choose>
              <if is-numeric="edition">
                <group delimiter=" ">
                  <number form="ordinal" variable="edition" />
                  <text form="short" suffix="." term="edition" />
                </group>
              </if>
              <else>
                <text suffix="." text-case="capitalize-first" variable="edition" />
              </else>
            </choose>
          </if>
        </choose>
      </macro>
      <macro name="locators-note">
        <choose>
          <if type="article-journal">
            <text prefix=" " variable="volume" />
            <text prefix=", no. " variable="issue" />
          </if>
          <else-if match="any" type="book chapter">
            <group delimiter=", " prefix=", ">
              <group>
                <text form="short" suffix=". " term="volume" />
                <number form="numeric" variable="volume" />
              </group>
              <choose>
                <if match="none" variable="locator">
                  <group>
                    <number form="numeric" variable="number-of-volumes" />
                    <text form="short" plural="true" prefix=" " suffix="." term="volume" />
                  </group>
                </if>
              </choose>
              <text macro="edition-note" />
            </group>
          </else-if>
        </choose>
      </macro>
      <macro name="locators">
        <choose>
          <if type="article-journal">
            <text prefix=" " variable="volume" />
            <text prefix=", no. " variable="issue" />
          </if>
          <else-if match="any" type="book">
            <group delimiter=". " prefix=". ">
              <group>
                <text form="short" suffix=". " term="volume" text-case="capitalize-first" />
                <number form="numeric" variable="volume" />
              </group>
              <group>
                <number form="numeric" variable="number-of-volumes" />
                <text form="short" plural="true" prefix=" " suffix="." term="volume" />
              </group>
              <text macro="edition" />
            </group>
          </else-if>
        </choose>
      </macro>
      <macro name="locators-newspaper">
        <choose>
          <if type="article-newspaper">
            <group delimiter=", ">
              <group>
                <text suffix=" " variable="edition" />
                <text prefix=" " term="edition" />
              </group>
              <group>
                <text form="short" suffix=". " term="section" />
                <text variable="section" />
              </group>
            </group>
          </if>
        </choose>
      </macro>
      <macro name="event">
        <group>
          <text suffix=" " term="presented at" />
          <text variable="event" />
        </group>
      </macro>
      <macro name="publisher">
        <group delimiter=": ">
          <text variable="publisher-place" />
          <text variable="publisher" />
        </group>
      </macro>
      <macro name="issued">
        <choose>
          <if match="any" type="graphic report">
            <date variable="issued">
              <date-part name="month" suffix=" " />
              <date-part name="day" suffix=", " />
              <date-part name="year" />
            </date>
          </if>
          <else-if match="any" type="book chapter thesis">
            <date variable="issued">
              <date-part name="year" />
            </date>
          </else-if>
          <else>
            <date variable="issued">
              <date-part name="month" suffix=" " />
              <date-part name="day" suffix=", " />
              <date-part name="year" />
            </date>
          </else>
        </choose>
      </macro>
      <macro name="point-locators-subsequent">
        <group>
          <choose>
            <if locator="page" match="none">
              <label form="short" strip-periods="false" suffix=" " variable="locator" />
            </if>
          </choose>
          <text variable="locator" />
        </group>
      </macro>
      <macro name="point-locators">
        <choose>
          <if match="none" variable="locator">
            <text macro="pages" />
          </if>
          <else-if type="article-journal">
            <text prefix=": " variable="locator" />
          </else-if>
          <else>
            <text macro="point-locators-subsequent" prefix=", " />
          </else>
        </choose>
      </macro>
      <macro name="pages">
        <choose>
          <if type="article-journal">
            <text prefix=": " variable="page" />
          </if>
          <else-if type="chapter">
            <text prefix=", " variable="page" />
          </else-if>
        </choose>
      </macro>
      <macro name="locators-chapter">
        <choose>
          <if type="chapter">
            <text suffix=":" variable="volume" />
            <text variable="page" />
          </if>
        </choose>
      </macro>
      <macro name="locators-journal">
        <choose>
          <if type="article-journal">
            <text prefix=": " variable="page" />
          </if>
        </choose>
      </macro>
      <macro name="archive-note">
        <group delimiter=", ">
          <text variable="archive_location" />
          <text variable="archive" />
          <text variable="archive-place" />
        </group>
      </macro>
      <macro name="archive">
        <group delimiter=". ">
          <text text-case="capitalize-first" variable="archive_location" />
          <text variable="archive" />
          <text variable="archive-place" />
        </group>
      </macro>
      <macro name="issue-note">
        <choose>
          <if type="article-journal">
            <text macro="issued" prefix=" (" suffix=")" />
          </if>
          <else-if match="any" variable="publisher-place publisher">
            <group delimiter=", " prefix=" (" suffix=")">
              <group delimiter=" ">
                <choose>
                  <if match="none" variable="title"> </if>
                  <else-if match="any" type="thesis speech">
                    <text variable="genre" />
                  </else-if>
                </choose>
                <text macro="event" />
              </group>
              <text macro="publisher" />
              <text macro="issued" />
            </group>
          </else-if>
          <else>
            <text macro="issued" prefix=", " />
          </else>
        </choose>
      </macro>
      <macro name="issue">
        <choose>
          <if type="article-journal">
            <text macro="issued" prefix=" (" suffix=")" />
          </if>
          <else-if type="speech">
            <choose>
              <if match="none" variable="title"> </if>
              <else>
                <text prefix=". " text-case="capitalize-first" variable="genre" />
              </else>
            </choose>
            <text macro="event" prefix=" " />
            <text prefix=", " variable="event-place" />
            <text macro="issued" prefix=", " />
          </else-if>
          <else-if match="any" variable="publisher-place publisher">
            <group delimiter=", " prefix=". ">
              <choose>
                <if type="thesis">
                  <text text-case="capitalize-first" variable="genre" />
                </if>
              </choose>
              <text macro="publisher" />
              <text macro="issued" />
            </group>
          </else-if>
          <else>
            <text macro="issued" prefix=", " />
          </else>
        </choose>
      </macro>
      <macro name="access-note">
        <group delimiter=", ">
          <choose>
            <if match="any" type="graphic report">
              <text macro="archive-note" />
            </if>
            <else-if match="none" type="book thesis chapter article-journal article-newspaper article-magazine">
              <text macro="archive-note" />
            </else-if>
          </choose>
          <text prefix="doi:" variable="DOI" />
          <text variable="URL" />
        </group>
      </macro>
      <macro name="access">
        <group delimiter=". ">
          <choose>
            <if match="any" type="graphic report">
              <text macro="archive" />
            </if>
            <else-if match="none" type="book thesis chapter article-journal article-newspaper article-magazine">
              <text macro="archive" />
            </else-if>
          </choose>
          <text variable="URL" />
        </group>
      </macro>
      <macro name="sort-key">
        <text macro="contributors-sort" suffix=" " />
        <text suffix=" " variable="title" />
        <text variable="genre" />
      </macro>
    
      <!-- ### BLUEBOOK AUTHOR ### -->
      <macro name="bb-author">
    	<names variable="author">
    	  <name/>
    	</names>
      </macro>
      <macro name="bb-author-short">
    	<names variable="author">
    	  <name form="short"/>
    	</names>
      </macro>
    
      <!-- ### BLUEBOOK ISSUED ### -->
      <macro name="bb-issued">
    	<group prefix="(" suffix=")">
    	  <date variable="issued" form="text" date-parts="year"/>
    	</group>
      </macro>
    
      <!-- ### ID BACKREFERENCES ### -->
      <macro name="bb-ibid">
    	<choose> 
    	  <if position="ibid-with-locator">
    		<text term="ibid" font-style="italic"/>
    		<group delimiter=" ">
    		  <choose>
    			<if locator="page">
    			  <text value=" at"/>
    			</if>
    			<else>
    			  <text value=", "/>
    			  <label form="short" variable="locator"/>
    			</else>
    		  </choose>
    		  <text variable="locator"/>
    		</group>
    	  </if>
    	  <else-if position="ibid">
    		<text term="ibid" font-style="italic"/>
    	  </else-if>
    	</choose>
      </macro>
    
      <!-- ### POINT LOCATORS -->
      <macro name="bb-point-locator">
    	<group delimiter=" ">
    	  <choose>
    		<if variable="number page" position="ibid" match="any">
    		  <text value=","/>
    		</if>
    	  </choose>
    	  <choose>
    		<if locator="page" match="none">
    		  <label form="symbol" variable="locator"/>
    		</if>
    	  </choose>
    	  <text variable="locator"/>
    	</group>
      </macro>
    
      <!-- ### LEGAL CASE ### -->
      <macro name="bb-legal-case">
    	<choose>
    	  <if position="first">
    		<text macro="bb-legal-case-first"/>
    	  </if>
    	  <else-if position="ibid">
    		<text macro="bb-ibid"/>
    	  </else-if>
    	  <else-if position="subsequent">
    
    	  </else-if>
    	</choose>
      </macro>
      <macro name="bb-legal-case-first">
        <group delimiter=", ">
          <text variable="title"/>
          <group delimiter=" ">
    		<choose>
    		  <if variable="issue">
    			<text variable="volume" prefix="[" suffix="]"/>
    			<text variable="issue"/>
    		  </if>
    		  <else>
    			<text variable="volume"/>
    		  </else>
    		</choose>
            <text variable="container-title"/>
    		<group>
    		  <text variable="page"/>
    		  <text macro="bb-point-locator"/>
    		</group>
            <group prefix="(" suffix=")" delimiter=" ">
              <text variable="authority" form="short"/>
              <date variable="issued">
                <date-part name="year"/>	
              </date>
            </group>	
          </group>
    	</group>
      </macro>
    
      <!-- ### LEGISLATION ### -->
      <macro name="bb-legislation">
    	<choose>
    	  <if position="first">
    		<text macro="bb-legislation-first"/>
    	  </if>
    	  <else-if position="near-note">
    		<text macro="bb-legislation-subsequent"/>
    	  </else-if>
    	  <else>
    		<text macro="bb-legislation-first"/>
    	  </else>
    	</choose>
      </macro>
      <macro name="bb-legislation-first">
    	<choose>
    	  <if variable="container-title">
    		<text macro="bb-statute-first"/>
    	  </if>
    	  <else>
    		<text macro="bb-code-first"/>
    	  </else>
    	</choose>
      </macro>
      <macro name="bb-legislation-subsequent">
    	<choose>
    	  <if variable="container-title">
    		<text macro="bb-statute-subsequent"/>
    	  </if>
    	  <else>
    		<text macro="bb-code-subsequent"/>
    	  </else>
    	</choose>
      </macro>
      <macro name="bb-statute-first">
    	<group delimiter=", ">
    	  <text variable="title"/>
    	  <text macro="bb-statute-subsequent"/>
    	</group>
      </macro>
      <macro name="bb-statute-subsequent">
    	<group delimiter="">
    	  <group delimiter=" ">
    		<text variable="volume"/>
    		<text variable="container-title"/>
    		<text variable="number"/>
    		<text variable="page"/>
    		<choose>
    		  <if is-numeric="section">
    			<text term="section" form="symbol"/>
    			<text variable="section"/>
    		  </if>
    		</choose>
    	  </group>
    	  <text macro="bb-point-locator"/>
    	  <date prefix=" (" variable="issued" date-parts="year" form="text" suffix=")"/>
    	</group>
      </macro>
      <macro name="bb-code-first">
    	<group delimiter=" ">
    	  <text variable="title" font-variant="small-caps"/>
    	  <group delimiter=" ">
    		<label variable="locator" form="symbol"/>
    		<text variable="locator"/>
    	  </group>
    	</group>
      </macro>
      <macro name="bb-code-subsequent">
    	<group delimiter=" ">
    	  <text variable="title" form="short" font-variant="small-caps"/>
    	  <group delimiter=" ">
    		<label variable="locator" form="symbol"/>
    		<text variable="locator"/>
    	  </group>
    	</group>
      </macro>
    
      <!-- ### BOOK ### -->
      <macro name="bb-book">
    	<choose>
    	  <if position="first">
    		<text macro="bb-book-first"/>
    	  </if>
    	  <else-if position="ibid">
    		<text macro="bb-ibid"/>
    	  </else-if>
    	  <else-if position="subsequent">
    		<text macro="bb-book-subsequent"/>
    	  </else-if>
    	</choose>
      </macro>
      <macro name="bb-book-first">
    	<group delimiter=", ">
    	  <text macro="bb-author" font-variant="small-caps"/>
    	  <group delimiter=" ">
    		<text variable="title" font-variant="small-caps" text-case="title"/>
    		<group delimiter=" ">
    		  <choose>
    			<if locator="page" match="none">
    			  <label variable="locator" form="symbol"/>
    			</if>
    		  </choose>
    		  <text variable="locator"/>
    		</group>
    		<text macro="bb-issued"/>
    	  </group>
    	</group>
      </macro>
      <macro name="bb-book-subsequent">
        <group delimiter=", ">
    	  <text macro="bb-author-short" font-variant="small-caps"/>
    	  <choose>
    		<if disambiguate="true">
    		  <text variable="title" font-variant="small-caps" text-case="title"/>
    		</if>
    	  </choose>
    	  <group delimiter="">
    		<group delimiter=" ">
    		  <text value="supra" font-style="italic"/>
    		  <choose>
    			<if variable="first-reference-note-number">
    			  <text value="note"/>
    			  <text variable="first-reference-note-number"/>
    			</if>
    		  </choose>
    		</group>
    		<group delimiter=" ">
    		  <choose>
    			<if locator="page">
    			  <text value=","/>
    			  <text value="at"/>
    			</if>
    			<else>
    			  <label variable="locator"/>
    			</else>
    		  </choose>
    		  <text variable="locator"/>
    		</group>
    	  </group>
    	</group>
      </macro>
    
      <!-- ### PERIODICAL ### -->
      <macro name="bb-periodical">
    	<choose>
    	  <if position="first">
    		<text macro="bb-periodical-first"/>
    	  </if>
    	  <else-if position="ibid">
    		<text term="ibid" font-style="italic"/>
    	  </else-if>
    	  <else-if position="subsequent">
    		<text macro="bb-periodical-subsequent"/>
    	  </else-if>
    	</choose>
      </macro>
      <macro name="bb-periodical-first">
    	<group delimiter=" ">
    	  <group delimiter=", ">
    		<names variable="author">
    		  <name/>
    		</names>
    		<text variable="title" font-style="italic"/>
    		<group delimiter=" ">
    		  <text variable="volume"/>
    		  <text variable="container-title" form="short" font-variant="small-caps"/>
    		  <text variable="page-first"/>
    		</group>
    	  </group>
    	  <text macro="bb-issued"/>
    	</group>
      </macro>
      <macro name="bb-periodical-subsequent">
    	<text value="bb-periodical-subsequent"/>
      </macro>
    
      <!-- ### CITATIONS ARE BLUEBOOK (demo version) ### -->
      <citation
             near-note-distance="5"
             et-al-min="2"
             et-al-subsequent-min="2"
             et-al-subsequent-use-first="1"
             et-al-use-first="1">
        <layout delimiter="; " suffix=".">
          <choose>
            <if type="legal_case">
              <text macro="bb-legal-case"/>
            </if>
    		<else-if type="legislation">
    		  <text macro="bb-legislation"/>
    		</else-if>
    		<else-if type="book">
    		  <text macro="bb-book"/>
    		</else-if>
            <else>
    		  <text macro="bb-periodical"/>
    		</else>
    	  </choose>
        </layout>
      </citation>
    
      <!-- BIBLIOGRAPHY IS CHICAGO FULLNOTE (mainstream) ### -->
      <bibliography
              entry-spacing="0"
             et-al-min="11"
             et-al-use-first="7"
             hanging-indent="true"
             subsequent-author-substitute="---">
        <sort>
          <key macro="sort-key" />
          <key variable="issued" />
        </sort>
        <layout suffix=".">	
    	  <choose>	
    		<if type="legal_case">
    		  <text macro="bb-legal-case"/>
    		</if>
    		<else-if type="legislation">
    		  <text macro="bb-legislation"/>
    		</else-if>
    		<else>
    		  <group delimiter=". ">
    			<text macro="contributors" />
    			<text macro="title" />
    			<text macro="description" />
    			<text macro="secondary-contributors" />
    			<group delimiter=", ">
    			  <text macro="container-title" />
    			  <text macro="container-contributors" />
    			  <text macro="locators-chapter" />
    			</group>
    		  </group>
    		  <text macro="locators" />
    		  <text macro="collection-title" prefix=". " />
    		  <text macro="issue" />
    		  <text macro="locators-newspaper" prefix=", " />
    		  <text macro="locators-journal" />
    		  <text macro="access" prefix=". " />	
    		</else>	
    	  </choose>
    	</layout>
      </bibliography>
    </style>

    """
    And the following input:
    """
    [{"author":[{"family":"Follett","given":"Ken"}],"id":"ITEM-1","issued":{"date-parts":[["1994"]]},"publisher":"Dell Publishing","publisher-place":"New York, N.Y.","title":"A dangerous fortune","type":"book"},{"author":[{"family":"Butler","given":"Samuel"},{"family":"Grey","given":"Zachary"}],"collection-title":"\"Chandos classics\"","id":"ITEM-2","issued":{"date-parts":[["1890"]]},"publisher":"F. Warne","publisher-place":"London; New York","title":"Hudibras","type":"book"}]
    """
    And I have a citations input
    When I cite all items
    Then the result should be:
    """
    ..[0] <span style="font-variant:small-caps;">Ken Follett</span>, <span style="font-variant:small-caps;">A Dangerous Fortune</span> (1994).
    ..[1] <span style="font-variant:small-caps;">Samuel Butler et al.</span>, <span style="font-variant:small-caps;">Hudibras</span> (1890).
    >>[2] <span style="font-variant:small-caps;">Follett</span>, <i>supra</i> note 1.
    """
