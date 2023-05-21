<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="/">
    <html>
      <head>
        <title>Document</title>
        <style>
          * {
            padding: 0;
            margin: 0;
            color: #fff;
            font-family: Arial, Helvetica, sans-serif;
          }
          body {
            width: 100%;
            height: 100%;
            background: rgb(2, 0, 36);
            background: linear-gradient(
              rgb(225, 48, 195) 0%,
              rgb(81, 38, 138) 45%,
              rgb(101, 45, 184) 100%
            );
            background-attachment: fixed;
          }
          header {
            text-align: center;
            font-size: 2rem;
            width: 100%;
            position: relative;
          }
          header::after {
            content: "";
            height: 2px;
            width: 50%;
            background-color: rgb(132, 0, 255);
            position: absolute;
            left: 50%;
            translate: -50% -50%;
            bottom: -10px;
          }
          .table-section {
            width: 100%;
            height: 500px;
            display: flex;
            align-items: center;
            justify-content: center;
          }
          td, th {
            border: 1px solid black;
            padding: 10px;
            text-align: center;
            font-size: 1.1rem;
          }
          caption {
            text-align: left;
            margin-bottom: 5px;
            font-size: 1.2rem;
          }
          .glass {
            background: linear-gradient(
              135deg,
              rgba(255, 255, 255, 0.1),
              rgba(255, 255, 255, 0)
            );
            backdrop-filter: blur(10px);
            -webkit-backdrop-filter: blur(10px);
            border-radius: 20px;
            border: 1px solid rgba(255, 255, 255, 0.18);
            box-shadow: 0 8px 32px 0 rgba(0, 0, 0, 0.37);
            padding: 20px;
          }
          #table2 {
            display: none;
          }
          #table3 {
            display: none;
          }
          .btn-section {
            width: 100%;
            height: 50px;
            display: flex;
            align-items: center;
            justify-content: space-evenly;
            margin-top: 30px;
          }
          button {
            color: #fff;
            max-width: 200px;
            padding: 5px;
            height: 50px;
            border: 2px solid rgb(132, 0, 255);
            background-color: transparent;
            outline: none;
            cursor: pointer;
            font-size: 1.1rem;
            border-radius: 20px;
            position: relative;
            overflow: hidden;
          }
          .btn-section button span {
            background-color: rgb(132, 0, 255);
            height: 100%;
            width: 0;
            position: absolute;
            left: 0;
            bottom: 0;
            z-index: -1;
            transition: 0.5s;
          }
          .btn-section button:hover span {
            width: 100%;
          }
        </style>
      </head>
      <body>
        <header>
          <h1>Tabele Transakcji</h1>
        </header>
        <main>
          <div class="btn-section">
            <button id="show-pln"><span></span> Pokaz transakcje w PLN</button>
            <button id="show-eur"><span></span> Pokaz transakcje w EUR</button>
            <button id="show-people">
              <span></span> Pokaz transakcje osob
            </button>
          </div>
          <section class="table-section">
            <div class="table glass" id="table1">
              <table>
                <caption>
                  Transakcje w PLN:
                </caption>
             <tr>
            <th>Lp.</th>
            <th>Nazwa transakcji</th>
            <th>Kwota</th>
          </tr>
          <xsl:variable name="transactions" select="transactions/transaction[kwota/@waluta='PLN' and (nazwa_transakcji='wpłata' or nazwa_transakcji='odsetki' or nazwa_transakcji='przelew' or nazwa_transakcji='korekta')]"/>
          <xsl:variable name="wpłataSum" select="sum($transactions[nazwa_transakcji='wpłata']/kwota)"/>
          <xsl:variable name="odsetkiSum" select="sum($transactions[nazwa_transakcji='odsetki']/kwota)"/>
          <xsl:variable name="przelewSum" select="sum($transactions[nazwa_transakcji='przelew']/kwota)"/>
          <xsl:variable name="korektaSum" select="sum($transactions[nazwa_transakcji='korekta']/kwota)"/>
          <tr>
           <td>1</td>
            <td>wpłata</td>
            <td><xsl:value-of select="$wpłataSum"/></td>
          </tr>
          <tr>
            <td>2</td>
            <td>odsetki</td>
            <td><xsl:value-of select="$odsetkiSum"/></td>
          </tr>
          <tr>
            <td>3</td>
            <td>przelew</td>
            <td><xsl:value-of select="$przelewSum"/></td>
          </tr>
          <tr>
            <td>4</td>
            <td>korekta</td>
            <td><xsl:value-of select="$korektaSum"/></td>
          </tr>
          <tr class="total-row">
            <td colspan="2">Suma</td>
            <td>
              <xsl:value-of select="sum($transactions/kwota)"/>
            </td>
          </tr>
              </table>
            </div>
            <div class="table glass" id="table2">
              <table>
                <caption>
                  Transakcje w EUR:
                </caption>
                  <tr>
            <th>Lp.</th>
            <th>Nazwa transakcji</th>
            <th>Kwota</th>
          </tr>
          <xsl:variable name="transactions" select="transactions/transaction[kwota/@waluta='EUR' and (nazwa_transakcji='wpłata' or nazwa_transakcji='odsetki' or nazwa_transakcji='przelew' or nazwa_transakcji='korekta')]"/>
          <xsl:variable name="wpłataSum" select="sum($transactions[nazwa_transakcji='wpłata']/kwota)"/>
          <xsl:variable name="odsetkiSum" select="sum($transactions[nazwa_transakcji='odsetki']/kwota)"/>
          <xsl:variable name="przelewSum" select="sum($transactions[nazwa_transakcji='przelew']/kwota)"/>
          <xsl:variable name="korektaSum" select="sum($transactions[nazwa_transakcji='korekta']/kwota)"/>
          <tr>
           <td>1</td>
            <td>wpłata</td>
            <td><xsl:value-of select="$wpłataSum"/></td>
          </tr>
          <tr>
            <td>2</td>
            <td>odsetki</td>
            <td><xsl:value-of select="$odsetkiSum"/></td>
          </tr>
          <tr>
            <td>3</td>
            <td>przelew</td>
            <td><xsl:value-of select="$przelewSum"/></td>
          </tr>
          <tr>
            <td>4</td>
            <td>korekta</td>
            <td><xsl:value-of select="$korektaSum"/></td>
          </tr>
          <tr class="total-row">
            <td colspan="2">Suma</td>
            <td>
              <xsl:value-of select="sum($transactions/kwota)"/>
            </td>
          </tr>
              </table>
            </div>
            <div class="table glass" id="table3">
              <table>
                <caption>
                  Ilość transakcji wykonanych przez poszczególne osoby:
                </caption>
                <tr>
            <th>Wykonawca</th>
            <th>Ilość transakcji</th>
          </tr>
          <xsl:variable name="janCount" select="count(transactions/transaction[wykonal='Jan J.'])"/>
          <xsl:variable name="ewaCount" select="count(transactions/transaction[wykonal='Ewa B.'])"/>
          <xsl:variable name="adamCount" select="count(transactions/transaction[wykonal='Adam A.'])"/>
          <tr>
            <td>Jan J.</td>
            <td><xsl:value-of select="$janCount"/></td>
          </tr>
          <tr>
            <td>Ewa B.</td>
            <td><xsl:value-of select="$ewaCount"/></td>
          </tr>
          <tr>
            <td>Adam A.</td>
            <td><xsl:value-of select="$adamCount"/></td>
          </tr>
              </table>
            </div>
          </section>
        </main>
        <script>
          let table1 = document.getElementById("table1");
          let table2 = document.getElementById("table2");
          let table3 = document.getElementById("table3");
          let showPlnBtn = document.getElementById("show-pln");
          let showEurBtn = document.getElementById("show-eur");
          let showPeopleBtn = document.getElementById("show-people");

          showPlnBtn.onclick = function () {
            table1.style.display = "block";
            table2.style.display = "none";
            table3.style.display = "none";
          };
          showEurBtn.onclick = function () {
            table1.style.display = "none";
            table2.style.display = "block";
            table3.style.display = "none";
          };
          showPeopleBtn.onclick = function () {
            table1.style.display = "none";
            table2.style.display = "none";
            table3.style.display = "block";
          };
        </script>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
