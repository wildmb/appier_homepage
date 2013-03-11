SignupView = Backbone.View.extend

    el: '#layout-signup'

    COUNTRY: {
        "BANGLADESH": "BD",
        "BELGIUM": "BE",
        "BURKINA FASO": "BF",
        "BULGARIA": "BG",
        "BOSNIA AND HERZEGOVINA": "BA",
        "BARBADOS": "BB",
        "WALLIS AND FUTUNA": "WF",
        "SAINT BARTHÉLEMY": "BL",
        "BERMUDA": "BM",
        "BRUNEI DARUSSALAM": "BN",
        "BOLIVIA, PLURINATIONAL STATE OF": "BO",
        "BAHRAIN": "BH",
        "BURUNDI": "BI",
        "BENIN": "BJ",
        "BHUTAN": "BT",
        "JAMAICA": "JM",
        "BOUVET ISLAND": "BV",
        "BOTSWANA": "BW",
        "SAMOA": "WS",
        "BONAIRE, SINT EUSTATIUS AND SABA": "BQ",
        "BRAZIL": "BR",
        "BAHAMAS": "BS",
        "JERSEY": "JE",
        "BELARUS": "BY",
        "BELIZE": "BZ",
        "RUSSIAN FEDERATION": "RU",
        "RWANDA": "RW",
        "SERBIA": "RS",
        "TIMOR-LESTE": "TL",
        "RÉUNION": "RE",
        "TURKMENISTAN": "TM",
        "TAJIKISTAN": "TJ",
        "ROMANIA": "RO",
        "TOKELA": "TK",
        "GUINEA-BISSA": "GW",
        "GUAM": "GU",
        "GUATEMALA": "GT",
        "SOUTH GEORGIA AND THE SOUTH SANDWICH ISLANDS": "GS",
        "GREECE": "GR",
        "EQUATORIAL GUINEA": "GQ",
        "GUADELOUPE": "GP",
        "JAPAN": "JP",
        "GUYANA": "GY",
        "GUERNSEY": "GG",
        "FRENCH GUIANA": "GF",
        "GEORGIA": "GE",
        "GRENADA": "GD",
        "UNITED KINGDOM": "GB",
        "GABON": "GA",
        "GUINEA": "GN",
        "GAMBIA": "GM",
        "GREENLAND": "GL",
        "GIBRALTAR": "GI",
        "GHANA": "GH",
        "OMAN": "OM",
        "TUNISIA": "TN",
        "JORDAN": "JO",
        "CROATIA": "HR",
        "HAITI": "HT",
        "HUNGARY": "HU",
        "HONG KONG": "HK",
        "HONDURAS": "HN",
        "HEARD ISLAND AND MCDONALD ISLANDS": "HM",
        "VENEZUELA, BOLIVARIAN REPUBLIC OF": "VE",
        "PUERTO RICO": "PR",
        "PALESTINIAN TERRITORY, OCCUPIED": "PS",
        "PALA": "PW",
        "PORTUGAL": "PT",
        "SAINT KITTS AND NEVIS": "KN",
        "PARAGUAY": "PY",
        "IRAQ": "IQ",
        "PANAMA": "PA",
        "FRENCH POLYNESIA": "PF",
        "PAPUA NEW GUINEA": "PG",
        "PER": "PE",
        "PAKISTAN": "PK",
        "PHILIPPINES": "PH",
        "PITCAIRN": "PN",
        "POLAND": "PL",
        "SAINT PIERRE AND MIQUELON": "PM",
        "ZAMBIA": "ZM",
        "WESTERN SAHARA": "EH",
        "ESTONIA": "EE",
        "EGYPT": "EG",
        "SOUTH AFRICA": "ZA",
        "ECUADOR": "EC",
        "ITALY": "IT",
        "VIET NAM": "VN",
        "SOLOMON ISLANDS": "SB",
        "ETHIOPIA": "ET",
        "SOMALIA": "SO",
        "ZIMBABWE": "ZW",
        "SAUDI ARABIA": "SA",
        "SPAIN": "ES",
        "ERITREA": "ER",
        "MONTENEGRO": "ME",
        "MOLDOVA, REPUBLIC OF": "MD",
        "MADAGASCAR": "MG",
        "SAINT MARTIN (FRENCH PART)": "MF",
        "MOROCCO": "MA",
        "MONACO": "MC",
        "UZBEKISTAN": "UZ",
        "MYANMAR": "MM",
        "MALI": "ML",
        "MACAO": "MO",
        "MONGOLIA": "MN",
        "MARSHALL ISLANDS": "MH",
        "MACEDONIA, THE FORMER YUGOSLAV REPUBLIC OF": "MK",
        "MAURITIUS": "MU",
        "MALTA": "MT",
        "MALAWI": "MW",
        "MALDIVES": "MV",
        "MARTINIQUE": "MQ",
        "NORTHERN MARIANA ISLANDS": "MP",
        "MONTSERRAT": "MS",
        "MAURITANIA": "MR",
        "ISLE OF MAN": "IM",
        "UGANDA": "UG",
        "TANZANIA, UNITED REPUBLIC OF": "TZ",
        "MALAYSIA": "MY",
        "MEXICO": "MX",
        "ISRAEL": "IL",
        "FRANCE": "FR",
        "ARUBA": "AW",
        "SAINT HELENA, ASCENSION AND TRISTAN DA CUNHA": "SH",
        "SVALBARD AND JAN MAYEN": "SJ",
        "FINLAND": "FI",
        "FIJI": "FJ",
        "FALKLAND ISLANDS (MALVINAS)": "FK",
        "MICRONESIA, FEDERATED STATES OF": "FM",
        "FAROE ISLANDS": "FO",
        "NICARAGUA": "NI",
        "NETHERLANDS": "NL",
        "NORWAY": "NO",
        "NAMIBIA": "NA",
        "VANUAT": "VU",
        "NEW CALEDONIA": "NC",
        "NIGER": "NE",
        "NORFOLK ISLAND": "NF",
        "NIGERIA": "NG",
        "NEW ZEALAND": "NZ",
        "NEPAL": "NP",
        "NAUR": "NR",
        "NIUE": "NU",
        "COOK ISLANDS": "CK",
        "CÔTE D'IVOIRE": "CI",
        "SWITZERLAND": "CH",
        "COLOMBIA": "CO",
        "CHINA": "CN",
        "CAMEROON": "CM",
        "CHILE": "CL",
        "COCOS (KEELING) ISLANDS": "CC",
        "CANADA": "CA",
        "CONGO": "CG",
        "CENTRAL AFRICAN REPUBLIC": "CF",
        "CONGO, THE DEMOCRATIC REPUBLIC OF THE": "CD",
        "CZECH REPUBLIC": "CZ",
        "CYPRUS": "CY",
        "CHRISTMAS ISLAND": "CX",
        "COSTA RICA": "CR",
        "CURAÇAO": "CW",
        "CAPE VERDE": "CV",
        "CUBA": "CU",
        "SWAZILAND": "SZ",
        "SYRIAN ARAB REPUBLIC": "SY",
        "SINT MAARTEN (DUTCH PART)": "SX",
        "KYRGYZSTAN": "KG",
        "KENYA": "KE",
        "SOUTH SUDAN": "SS",
        "SURINAME": "SR",
        "KIRIBATI": "KI",
        "CAMBODIA": "KH",
        "EL SALVADOR": "SV",
        "COMOROS": "KM",
        "SAO TOME AND PRINCIPE": "ST",
        "SLOVAKIA": "SK",
        "KOREA (SOUTH KOREA)": "KR",
        "SLOVENIA": "SI",
        "KOREA (NORTH KOREA)": "KP",
        "KUWAIT": "KW",
        "SENEGAL": "SN",
        "SAN MARINO": "SM",
        "SIERRA LEONE": "SL",
        "SEYCHELLES": "SC",
        "KAZAKHSTAN": "KZ",
        "CAYMAN ISLANDS": "KY",
        "SINGAPORE": "SG",
        "SWEDEN": "SE",
        "SUDAN": "SD",
        "DOMINICAN REPUBLIC": "DO",
        "DOMINICA": "DM",
        "DJIBOUTI": "DJ",
        "DENMARK": "DK",
        "VIRGIN ISLANDS, BRITISH": "VG",
        "GERMANY": "DE",
        "YEMEN": "YE",
        "ALGERIA": "DZ",
        "UNITED STATES": "US",
        "URUGUAY": "UY",
        "MAYOTTE": "YT",
        "UNITED STATES MINOR OUTLYING ISLANDS": "UM",
        "LEBANON": "LB",
        "SAINT LUCIA": "LC",
        "LAO PEOPLE'S DEMOCRATIC REPUBLIC": "LA",
        "TUVAL": "TV",
        "TAIWAN": "TW",
        "TRINIDAD AND TOBAGO": "TT",
        "TURKEY": "TR",
        "SRI LANKA": "LK",
        "LIECHTENSTEIN": "LI",
        "LATVIA": "LV",
        "TONGA": "TO",
        "LITHUANIA": "LT",
        "LUXEMBOURG": "LU",
        "LIBERIA": "LR",
        "LESOTHO": "LS",
        "THAILAND": "TH",
        "FRENCH SOUTHERN TERRITORIES": "TF",
        "TOGO": "TG",
        "CHAD": "TD",
        "TURKS AND CAICOS ISLANDS": "TC",
        "LIBYA": "LY",
        "HOLY SEE (VATICAN CITY STATE)": "VA",
        "SAINT VINCENT AND THE GRENADINES": "VC",
        "UNITED ARAB EMIRATES": "AE",
        "ANDORRA": "AD",
        "ANTIGUA AND BARBUDA": "AG",
        "AFGHANISTAN": "AF",
        "ANGUILLA": "AI",
        "VIRGIN ISLANDS, U.S.": "VI",
        "ICELAND": "IS",
        "IRAN, ISLAMIC REPUBLIC OF": "IR",
        "ARMENIA": "AM",
        "ALBANIA": "AL",
        "ANGOLA": "AO",
        "ANTARCTICA": "AQ",
        "AMERICAN SAMOA": "AS",
        "ARGENTINA": "AR",
        "AUSTRALIA": "AU",
        "AUSTRIA": "AT",
        "BRITISH INDIAN OCEAN TERRITORY": "IO",
        "INDIA": "IN",
        "ÅLAND ISLANDS": "AX",
        "AZERBAIJAN": "AZ",
        "IRELAND": "IE",
        "INDONESIA": "ID",
        "UKRAINE": "UA",
        "QATAR": "QA",
        "MOZAMBIQUE": "MZ"
    }

    TEMPLATE: """
        <h4>Sign up now</h4>
        Find your international promotion partners in one stop.<br><br>
        <form class="form-horizontal" method="POST">
            <div class="control-group">
            <label class="control-label" for="signup-first-name">First Name*</label>
            <div class="controls">
                <input type="text" id="signup-first-name" max-length="64">
            </div>
          </div>
          <div class="control-group">
            <label class="control-label" for="signup-last-name">Last Name*</label>
            <div class="controls">
                <input type="text" id="signup-last-name" max-length="64">
            </div>
          </div>
          <div class="control-group">
            <label class="control-label" for="signup-company">Company*</label>
            <div class="controls">
                <input type="text" id="signup-company" max-length="255">
            </div>
          </div>
          <div class="control-group">
            <label class="control-label" for="signup-country">Country*</label>
            <div class="controls">
                <select id="signup-country">
                    <% for (var i = 0; i < countryNames.length; i++) { %>
                        <% countryName = countryNames[i] %>
                        <option value="<%- window.signupView.COUNTRY[countryName] %>" <%- (countryName === 'TAIWAN') ? 'selected' : '' %>>
                            <%- countryName %>
                        </option>
                    <% } %>
                </select>
            </div>
          </div>
          <div class="control-group">
            <label class="control-label" for="signup-email">Email*</label>
            <div class="controls">
                <input type="text" id="signup-email" max-length="255">
            </div>
          </div>
          <div class="control-group">
            <label class="control-label" for="signup-password">Password*</label>
            <div class="controls">
                <input type="text" id="signup-email" max-length="255">
            </div>
          </div>
          <div class="control-group">
            <label class="control-label" for="signup-email">Confirm Password*</label>
            <div class="controls">
                <input type="text" id="signup-confirm-password" max-length="255">
            </div>
          </div>
        </form>
        <div class="getstart-btn"></div>
    """

    render: ->

        # sort country alphabetically
        countryNames = _.keys SignupView::COUNTRY
        countryNames.sort()

        @$el.html(_.template(SignupView::TEMPLATE, countryNames: countryNames))
        @


window.signupView = new SignupView()
window.signupView.render()