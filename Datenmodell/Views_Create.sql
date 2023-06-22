----------------------------------------------------------
-- Generell

DROP MATERIALIZED VIEW "StadtlaufBS"."mvw_ReportBlfrgMaterialLieferblattPos";
DROP MATERIALIZED VIEW "StadtlaufBS"."mvw_ReportBlfrgMaterialLieferblattMaterial";
DROP MATERIALIZED VIEW "StadtlaufBS"."mvw_ReportBlfrgMaterialBedarf";
DROP MATERIALIZED VIEW "StadtlaufBS"."mvw_BlfrgMaterialAllePos";
DROP MATERIALIZED VIEW "StadtlaufBS"."mvw_BlfrgSektBesammlungPos";
DROP MATERIALIZED VIEW "StadtlaufBS"."mvw_BlfrgSektLieferPos";
DROP MATERIALIZED VIEW "StadtlaufBS"."mvw_BlfrgVorsignal";
DROP MATERIALIZED VIEW "StadtlaufBS"."mvw_BlfrgSignalisation";
DROP MATERIALIZED VIEW "StadtlaufBS"."mvw_BlfrgLieferPos";
DROP MATERIALIZED VIEW "StadtlaufBS"."mvw_BlfrgDispoPos";
DROP MATERIALIZED VIEW "StadtlaufBS"."mvw_BlfrgPositionen";
DROP MATERIALIZED VIEW "StadtlaufBS"."mvw_BlfrgAnlassSektoren";
DROP MATERIALIZED VIEW "StadtlaufBS"."mvw_ReportDispoAuftragPos";
DROP MATERIALIZED VIEW "StadtlaufBS"."mvw_ReportBesatzungHelferBedarf";
DROP MATERIALIZED VIEW "StadtlaufBS"."mvw_ReportBesatzungBedarf";
DROP MATERIALIZED VIEW "StadtlaufBS"."mvw_BesatzungHelferBedarf";
DROP MATERIALIZED VIEW "StadtlaufBS"."mvw_BesatzungBedarf";
DROP MATERIALIZED VIEW "StadtlaufBS"."mvw_BasisDokument";
DROP MATERIALIZED VIEW "StadtlaufBS"."mvw_BasisBesatzungHelfer";
DROP MATERIALIZED VIEW "StadtlaufBS"."mvw_BasisBesatzung";
DROP MATERIALIZED VIEW "StadtlaufBS"."mvw_BasisVorsignal";
DROP MATERIALIZED VIEW "StadtlaufBS"."mvw_BasisAusruestung";
DROP MATERIALIZED VIEW "StadtlaufBS"."mvw_BasisPositionen";
DROP MATERIALIZED VIEW "StadtlaufBS"."mvw_BasisAnlassSektoren";
DROP MATERIALIZED VIEW "StadtlaufBS"."mvw_BasisAustragung";


----------------------------------------------------------
-- Basis-Views

-- Anlass/Austragung
CREATE
MATERIALIZED VIEW "StadtlaufBS"."mvw_BasisAustragung" AS
SELECT
"StadtlaufBS"."AUSTRAGUNG"."AUSTRAGUNG_ID",
"StadtlaufBS"."AUSTRAGUNG"."AUSTRAGUNG_DT",
"StadtlaufBS"."AUSTRAGUNG"."AUSTRAGUNG_ZUS_DSC",
"StadtlaufBS"."AUSTRAGUNG"."PLAN_VERKEHRSREGIME_URL",
"StadtlaufBS"."ANLASS"."ANLASS_ID",
"StadtlaufBS"."ANLASS"."ANLASS_NM",
"StadtlaufBS"."ANLASS"."ANLASS_DSC",
"StadtlaufBS"."ANLASS"."ANLASS_LOGO_URL",
"StadtlaufBS"."ANLASS"."POLIZEI_ABTEILUNG_NM",
"StadtlaufBS"."ANLASS"."POLIZEI_LOGO_URL",
"StadtlaufBS"."ANLASS"."DISPO_DOKU_TI"
FROM
"StadtlaufBS"."AUSTRAGUNG"
JOIN "StadtlaufBS"."ANLASS"   ON "StadtlaufBS"."AUSTRAGUNG"."ANLASS_ID" = "StadtlaufBS"."ANLASS"."ANLASS_ID";

-- Sektor
CREATE
MATERIALIZED VIEW "StadtlaufBS"."mvw_BasisAnlassSektoren" AS
SELECT
"StadtlaufBS"."SEKTOR_AKTIV"."SEKTOR_AKTIV_ID",
"StadtlaufBS"."SEKTOR_AKTIV"."SEKTOR_SRT",
"StadtlaufBS"."SEKTOR_AKTIV"."SEKTOR_CHEF_NM",
"StadtlaufBS"."SEKTOR_AKTIV"."BESAMMLUNG_ZT",
"StadtlaufBS"."SEKTOR_AKTIV"."BESAMMLUNG_ORT_ID",
"StadtlaufBS"."SEKTOR_AKTIV"."POSITION_LIEFERUNG_ID",
"StadtlaufBS"."SEKTOR_AKTIV"."PLAN_DISPOSITIV_URL",
"StadtlaufBS"."SEKTOR_AKTIV"."PLAN_POSITIONEN_URL",
"StadtlaufBS"."SEKTOR_AKTIV"."PLAN_BESAMMLUNG_URL",
"StadtlaufBS"."SEKTOR_AKTIV"."PLAN_LIEFERORTE_URL",
"StadtlaufBS"."SEKTOR"."SEKTOR_BZ",
"StadtlaufBS"."SEKTOR"."SEKTOR_NM",
"StadtlaufBS"."SEKTOR"."SEKTOR_ID",
"StadtlaufBS"."SEKTOR_TYP"."SEKTOR_TYP_ID",
"StadtlaufBS"."SEKTOR_TYP"."SEKTOR_TYP_BZ",
"StadtlaufBS"."mvw_BasisAustragung"."AUSTRAGUNG_ID",
"StadtlaufBS"."mvw_BasisAustragung"."AUSTRAGUNG_DT",
"StadtlaufBS"."mvw_BasisAustragung"."AUSTRAGUNG_ZUS_DSC",
"StadtlaufBS"."mvw_BasisAustragung"."PLAN_VERKEHRSREGIME_URL",
"StadtlaufBS"."mvw_BasisAustragung"."ANLASS_ID",
"StadtlaufBS"."mvw_BasisAustragung"."ANLASS_NM",
"StadtlaufBS"."mvw_BasisAustragung"."ANLASS_DSC",
"StadtlaufBS"."mvw_BasisAustragung"."ANLASS_LOGO_URL",
"StadtlaufBS"."mvw_BasisAustragung"."POLIZEI_ABTEILUNG_NM",
"StadtlaufBS"."mvw_BasisAustragung"."POLIZEI_LOGO_URL",
"StadtlaufBS"."mvw_BasisAustragung"."DISPO_DOKU_TI"
FROM
"StadtlaufBS"."SEKTOR_AKTIV"
JOIN "StadtlaufBS"."SEKTOR"                           ON "StadtlaufBS"."SEKTOR_AKTIV"."SEKTOR_ID" = "StadtlaufBS"."SEKTOR"."SEKTOR_ID"
JOIN "StadtlaufBS"."SEKTOR_TYP"                       ON "StadtlaufBS"."SEKTOR"."SEKTOR_TYP_ID" = "StadtlaufBS"."SEKTOR_TYP"."SEKTOR_TYP_ID"
JOIN "StadtlaufBS"."mvw_BasisAustragung"              ON "StadtlaufBS"."SEKTOR_AKTIV"."AUSTRAGUNG_ID" = "StadtlaufBS"."mvw_BasisAustragung"."AUSTRAGUNG_ID";

-- Position
CREATE
MATERIALIZED VIEW "StadtlaufBS"."mvw_BasisPositionen" AS
SELECT
"StadtlaufBS"."DISPOSITIV"."POSITION_TX",
"StadtlaufBS"."DISPOSITIV"."POSITION_NR",
"StadtlaufBS"."DISPOSITIV"."POSITION_BZ",
"StadtlaufBS"."DISPOSITIV"."SEKTOR_AKTIV_ID",
"StadtlaufBS"."POSITION"."POSITION_ID",
"StadtlaufBS"."POSITION"."POSITION_DSC",
"StadtlaufBS"."POSITION"."ORTSCHAFT_TX",
"StadtlaufBS"."POSITION"."OERTLICHKEIT_TX",
"StadtlaufBS"."POSITION"."ABSCHNITT_TX",
"StadtlaufBS"."POSITION"."BEREIT_ZT",
"StadtlaufBS"."POSITION"."SPERRE_AB_ZT",
"StadtlaufBS"."POSITION"."SPERRE_BIS_ZT",
"StadtlaufBS"."POSITION"."AUFTRAG_ANW",
"StadtlaufBS"."POSITION"."MASSNAHME_ANW",
"StadtlaufBS"."POSITION"."AUFBAU_ANW",
"StadtlaufBS"."POSITION"."SITUATION_BILD_URL",
"StadtlaufBS"."POSITION"."LIEFER_POS_ID",
"StadtlaufBS"."POSITION"."POSITION_TYP_ID",
"StadtlaufBS"."POSITION_TYP"."POSITION_TYP_BZ"
FROM
"StadtlaufBS"."DISPOSITIV"
JOIN "StadtlaufBS"."POSITION"                                 ON "StadtlaufBS"."DISPOSITIV"."POSITION_ID" = "StadtlaufBS"."POSITION"."POSITION_ID"
JOIN "StadtlaufBS"."POSITION_TYP"                             ON "StadtlaufBS"."POSITION"."POSITION_TYP_ID" = "StadtlaufBS"."POSITION_TYP"."POSITION_TYP_ID";

-- Position/Ausrüstung/Material
CREATE
MATERIALIZED VIEW "StadtlaufBS"."mvw_BasisAusruestung" AS
SELECT
"StadtlaufBS"."mvw_BasisPositionen"."POSITION_TX",
"StadtlaufBS"."mvw_BasisPositionen"."POSITION_NR",
"StadtlaufBS"."mvw_BasisPositionen"."POSITION_BZ",
"StadtlaufBS"."mvw_BasisPositionen"."SEKTOR_AKTIV_ID",
"StadtlaufBS"."mvw_BasisPositionen"."POSITION_ID",
"StadtlaufBS"."mvw_BasisPositionen"."POSITION_DSC",
"StadtlaufBS"."mvw_BasisPositionen"."ORTSCHAFT_TX",
"StadtlaufBS"."mvw_BasisPositionen"."OERTLICHKEIT_TX",
"StadtlaufBS"."mvw_BasisPositionen"."ABSCHNITT_TX",
"StadtlaufBS"."mvw_BasisPositionen"."BEREIT_ZT",
"StadtlaufBS"."mvw_BasisPositionen"."SPERRE_AB_ZT",
"StadtlaufBS"."mvw_BasisPositionen"."SPERRE_BIS_ZT",
"StadtlaufBS"."mvw_BasisPositionen"."AUFTRAG_ANW",
"StadtlaufBS"."mvw_BasisPositionen"."MASSNAHME_ANW",
"StadtlaufBS"."mvw_BasisPositionen"."AUFBAU_ANW",
"StadtlaufBS"."mvw_BasisPositionen"."SITUATION_BILD_URL",
"StadtlaufBS"."mvw_BasisPositionen"."LIEFER_POS_ID",
"StadtlaufBS"."mvw_BasisPositionen"."POSITION_TYP_ID",
"StadtlaufBS"."mvw_BasisPositionen"."POSITION_TYP_BZ",
"StadtlaufBS"."MATERIAL"."MATERIAL_ID",
"StadtlaufBS"."MATERIAL"."MATERIAL_BZ",
"StadtlaufBS"."MATERIAL"."MATERIAL_NM",
"StadtlaufBS"."MATERIAL"."MATERIAL_ICON_URL",
"StadtlaufBS"."MATERIAL"."LIEFERART_ID",
"StadtlaufBS"."AUSRUESTUNG"."AUSRUESTUNG_AZ",
"StadtlaufBS"."LIEFERART"."LIEFERART_BZ",
"StadtlaufBS"."LIEFERART"."LIEFERART_DSC"
FROM
"StadtlaufBS"."AUSRUESTUNG"
JOIN "StadtlaufBS"."mvw_BasisPositionen"   ON "StadtlaufBS"."AUSRUESTUNG"."POSITION_ID" = "StadtlaufBS"."mvw_BasisPositionen"."POSITION_ID"
JOIN "StadtlaufBS"."MATERIAL"              ON "StadtlaufBS"."AUSRUESTUNG"."MATERIAL_ID" = "StadtlaufBS"."MATERIAL"."MATERIAL_ID"
JOIN "StadtlaufBS"."LIEFERART"             ON "StadtlaufBS"."MATERIAL"."LIEFERART_ID" = "StadtlaufBS"."LIEFERART"."LIEFERART_ID";

-- Position/Vorsignal
CREATE
MATERIALIZED VIEW "StadtlaufBS"."mvw_BasisVorsignal" AS
SELECT
"StadtlaufBS"."mvw_BasisPositionen"."POSITION_TX",
"StadtlaufBS"."mvw_BasisPositionen"."POSITION_NR",
"StadtlaufBS"."mvw_BasisPositionen"."POSITION_BZ",
"StadtlaufBS"."mvw_BasisPositionen"."SEKTOR_AKTIV_ID",
"StadtlaufBS"."mvw_BasisPositionen"."POSITION_ID",
"StadtlaufBS"."mvw_BasisPositionen"."POSITION_DSC",
"StadtlaufBS"."mvw_BasisPositionen"."ORTSCHAFT_TX",
"StadtlaufBS"."mvw_BasisPositionen"."OERTLICHKEIT_TX",
"StadtlaufBS"."mvw_BasisPositionen"."ABSCHNITT_TX",
"StadtlaufBS"."mvw_BasisPositionen"."BEREIT_ZT",
"StadtlaufBS"."mvw_BasisPositionen"."SPERRE_AB_ZT",
"StadtlaufBS"."mvw_BasisPositionen"."SPERRE_BIS_ZT",
"StadtlaufBS"."mvw_BasisPositionen"."AUFTRAG_ANW",
"StadtlaufBS"."mvw_BasisPositionen"."MASSNAHME_ANW",
"StadtlaufBS"."mvw_BasisPositionen"."AUFBAU_ANW",
"StadtlaufBS"."mvw_BasisPositionen"."SITUATION_BILD_URL",
"StadtlaufBS"."mvw_BasisPositionen"."LIEFER_POS_ID",
"StadtlaufBS"."mvw_BasisPositionen"."POSITION_TYP_ID",
"StadtlaufBS"."mvw_BasisPositionen"."POSITION_TYP_BZ",
"StadtlaufBS"."MATERIAL"."MATERIAL_ID",
"StadtlaufBS"."MATERIAL"."MATERIAL_BZ",
"StadtlaufBS"."MATERIAL"."MATERIAL_NM",
"StadtlaufBS"."MATERIAL"."MATERIAL_ICON_URL",
"StadtlaufBS"."MATERIAL"."LIEFERART_ID",
"StadtlaufBS"."VORSIGNAL"."VORSIGNAL_ID",
"StadtlaufBS"."VORSIGNAL"."VORSIGNAL_ORT_TX",
"StadtlaufBS"."VORSIGNAL"."PERSONAL_TYP_ID",
"StadtlaufBS"."PERSONAL_TYP"."PERSONAL_TYP_BZ",
"StadtlaufBS"."PERSONAL_TYP"."PERSONAL_TYP_NM",
"StadtlaufBS"."PERSONAL_TYP"."PERSONAL_TYP_ICON_URL",
"StadtlaufBS"."LIEFERART"."LIEFERART_BZ",
"StadtlaufBS"."LIEFERART"."LIEFERART_DSC"
FROM
"StadtlaufBS"."VORSIGNAL"
JOIN "StadtlaufBS"."mvw_BasisPositionen"   ON "StadtlaufBS"."VORSIGNAL"."POSITION_ID" = "StadtlaufBS"."mvw_BasisPositionen"."POSITION_ID"
JOIN "StadtlaufBS"."MATERIAL"              ON "StadtlaufBS"."VORSIGNAL"."MATERIAL_ID" = "StadtlaufBS"."MATERIAL"."MATERIAL_ID"
LEFT JOIN "StadtlaufBS"."PERSONAL_TYP"     ON "StadtlaufBS"."VORSIGNAL"."PERSONAL_TYP_ID" = "StadtlaufBS"."PERSONAL_TYP"."PERSONAL_TYP_ID"
JOIN "StadtlaufBS"."LIEFERART"             ON "StadtlaufBS"."MATERIAL"."LIEFERART_ID" = "StadtlaufBS"."LIEFERART"."LIEFERART_ID";

-- Position/Besatzung
CREATE
MATERIALIZED VIEW "StadtlaufBS"."mvw_BasisBesatzung" AS
SELECT
"StadtlaufBS"."mvw_BasisPositionen"."POSITION_TX",
"StadtlaufBS"."mvw_BasisPositionen"."POSITION_NR",
"StadtlaufBS"."mvw_BasisPositionen"."POSITION_BZ",
"StadtlaufBS"."mvw_BasisPositionen"."SEKTOR_AKTIV_ID",
"StadtlaufBS"."mvw_BasisPositionen"."POSITION_ID",
"StadtlaufBS"."mvw_BasisPositionen"."POSITION_DSC",
"StadtlaufBS"."mvw_BasisPositionen"."ORTSCHAFT_TX",
"StadtlaufBS"."mvw_BasisPositionen"."OERTLICHKEIT_TX",
"StadtlaufBS"."mvw_BasisPositionen"."ABSCHNITT_TX",
"StadtlaufBS"."mvw_BasisPositionen"."BEREIT_ZT",
"StadtlaufBS"."mvw_BasisPositionen"."SPERRE_AB_ZT",
"StadtlaufBS"."mvw_BasisPositionen"."SPERRE_BIS_ZT",
"StadtlaufBS"."mvw_BasisPositionen"."AUFTRAG_ANW",
"StadtlaufBS"."mvw_BasisPositionen"."MASSNAHME_ANW",
"StadtlaufBS"."mvw_BasisPositionen"."AUFBAU_ANW",
"StadtlaufBS"."mvw_BasisPositionen"."SITUATION_BILD_URL",
"StadtlaufBS"."mvw_BasisPositionen"."LIEFER_POS_ID",
"StadtlaufBS"."mvw_BasisPositionen"."POSITION_TYP_ID",
"StadtlaufBS"."mvw_BasisPositionen"."POSITION_TYP_BZ",
"StadtlaufBS"."PERSONAL_TYP"."PERSONAL_TYP_ID",
"StadtlaufBS"."PERSONAL_TYP"."PERSONAL_TYP_BZ",
"StadtlaufBS"."PERSONAL_TYP"."PERSONAL_TYP_NM",
"StadtlaufBS"."PERSONAL_TYP"."PERSONAL_TYP_ICON_URL",
"StadtlaufBS"."BESATZUNG"."BESATZUNG_ID",
"StadtlaufBS"."BESATZUNG"."PERSONAL_AZ",
"StadtlaufBS"."BESATZUNG"."AUFTRAG_SPZ_ANW"
FROM
"StadtlaufBS"."BESATZUNG"
JOIN "StadtlaufBS"."mvw_BasisPositionen"   ON "StadtlaufBS"."BESATZUNG"."POSITION_ID" = "StadtlaufBS"."mvw_BasisPositionen"."POSITION_ID"
JOIN "StadtlaufBS"."PERSONAL_TYP"          ON "StadtlaufBS"."BESATZUNG"."PERSONAL_TYP_ID" = "StadtlaufBS"."PERSONAL_TYP"."PERSONAL_TYP_ID";

-- Position/Besatzung/Helfer
CREATE
MATERIALIZED VIEW "StadtlaufBS"."mvw_BasisBesatzungHelfer" AS
SELECT
"StadtlaufBS"."mvw_BasisBesatzung"."POSITION_TX",
"StadtlaufBS"."mvw_BasisBesatzung"."POSITION_NR",
"StadtlaufBS"."mvw_BasisBesatzung"."POSITION_BZ",
"StadtlaufBS"."mvw_BasisBesatzung"."SEKTOR_AKTIV_ID",
"StadtlaufBS"."mvw_BasisBesatzung"."POSITION_ID",
"StadtlaufBS"."mvw_BasisBesatzung"."POSITION_DSC",
"StadtlaufBS"."mvw_BasisBesatzung"."ORTSCHAFT_TX",
"StadtlaufBS"."mvw_BasisBesatzung"."OERTLICHKEIT_TX",
"StadtlaufBS"."mvw_BasisBesatzung"."ABSCHNITT_TX",
"StadtlaufBS"."mvw_BasisBesatzung"."BEREIT_ZT",
"StadtlaufBS"."mvw_BasisBesatzung"."SPERRE_AB_ZT",
"StadtlaufBS"."mvw_BasisBesatzung"."SPERRE_BIS_ZT",
"StadtlaufBS"."mvw_BasisBesatzung"."AUFTRAG_ANW",
"StadtlaufBS"."mvw_BasisBesatzung"."MASSNAHME_ANW",
"StadtlaufBS"."mvw_BasisBesatzung"."AUFBAU_ANW",
"StadtlaufBS"."mvw_BasisBesatzung"."SITUATION_BILD_URL",
"StadtlaufBS"."mvw_BasisBesatzung"."LIEFER_POS_ID",
"StadtlaufBS"."mvw_BasisBesatzung"."POSITION_TYP_ID",
"StadtlaufBS"."mvw_BasisBesatzung"."POSITION_TYP_BZ",
"StadtlaufBS"."mvw_BasisBesatzung"."PERSONAL_TYP_ID",
"StadtlaufBS"."mvw_BasisBesatzung"."PERSONAL_TYP_BZ",
"StadtlaufBS"."mvw_BasisBesatzung"."PERSONAL_TYP_NM",
"StadtlaufBS"."mvw_BasisBesatzung"."PERSONAL_TYP_ICON_URL",
"StadtlaufBS"."mvw_BasisBesatzung"."BESATZUNG_ID",
"StadtlaufBS"."mvw_BasisBesatzung"."PERSONAL_AZ",
"StadtlaufBS"."mvw_BasisBesatzung"."AUFTRAG_SPZ_ANW",
"StadtlaufBS"."EINSATZ"."EINSATZ_VON_ZT",
"StadtlaufBS"."EINSATZ"."EINSATZ_BIS_ZT",
"StadtlaufBS"."EINSATZ"."AUFTRAG_ZUS_ANW",
"StadtlaufBS"."HELFER"."HELFER_ID",
"StadtlaufBS"."HELFER"."HELFER_NM",
"StadtlaufBS"."HELFER"."HELFER_EMAIL_ADR",
"StadtlaufBS"."HELFER"."HELFER_TEL_NR",
"StadtlaufBS"."HELFER"."HELFER_AZ"
FROM
"StadtlaufBS"."mvw_BasisBesatzung"
JOIN "StadtlaufBS"."EINSATZ"    ON "StadtlaufBS"."mvw_BasisBesatzung"."BESATZUNG_ID" = "StadtlaufBS"."EINSATZ"."BESATZUNG_ID"
JOIN "StadtlaufBS"."HELFER"     ON "StadtlaufBS"."EINSATZ"."HELFER_ID" = "StadtlaufBS"."HELFER"."HELFER_ID";

-- Position/Ausrüstung/Material
CREATE
MATERIALIZED VIEW "StadtlaufBS"."mvw_BasisDokument" AS
SELECT
"StadtlaufBS"."DOK_INHALT"."DOKUMENT_ID",
"StadtlaufBS"."DOK_INHALT"."POSITION_TYP_ID",
"StadtlaufBS"."DOK_INHALT"."SEKTOR_TYP_ID",
"StadtlaufBS"."DOK_INHALT"."LIEFERART_ID",
"StadtlaufBS"."DOKUMENT"."DOKUMENT_TI",
"StadtlaufBS"."DOKUMENT"."DOKUMENT_PGM",
"StadtlaufBS"."DOKUMENT"."DOKUMENT_ERGAENZUNG_URL",
"StadtlaufBS"."SEKTOR_TYP"."SEKTOR_TYP_BZ",
"StadtlaufBS"."POSITION_TYP"."POSITION_TYP_BZ",
"StadtlaufBS"."LIEFERART"."LIEFERART_BZ",
"StadtlaufBS"."LIEFERART"."LIEFERART_DSC"
FROM
"StadtlaufBS"."DOK_INHALT"
JOIN "StadtlaufBS"."DOKUMENT"     ON "StadtlaufBS"."DOK_INHALT"."DOKUMENT_ID" = "StadtlaufBS"."DOKUMENT"."DOKUMENT_ID"
JOIN "StadtlaufBS"."SEKTOR_TYP"   ON "StadtlaufBS"."DOK_INHALT"."SEKTOR_TYP_ID" = "StadtlaufBS"."SEKTOR_TYP"."SEKTOR_TYP_ID"
JOIN "StadtlaufBS"."POSITION_TYP" ON "StadtlaufBS"."DOK_INHALT"."POSITION_TYP_ID" = "StadtlaufBS"."POSITION_TYP"."POSITION_TYP_ID"
JOIN "StadtlaufBS"."LIEFERART"    ON "StadtlaufBS"."DOK_INHALT"."LIEFERART_ID" = "StadtlaufBS"."LIEFERART"."LIEFERART_ID";

----------------------------------------------------------
-- Dispo

-- Sektor/Positionen-Liste
CREATE
MATERIALIZED VIEW "StadtlaufBS"."mvw_ReportDispoAuftragPos" AS
SELECT
"StadtlaufBS"."mvw_BasisDokument"."DOKUMENT_ID",
"StadtlaufBS"."mvw_BasisDokument"."POSITION_TYP_ID",
"StadtlaufBS"."mvw_BasisDokument"."SEKTOR_TYP_ID",
"StadtlaufBS"."mvw_BasisDokument"."LIEFERART_ID",
"StadtlaufBS"."mvw_BasisDokument"."DOKUMENT_TI",
"StadtlaufBS"."mvw_BasisDokument"."DOKUMENT_PGM",
"StadtlaufBS"."mvw_BasisDokument"."DOKUMENT_ERGAENZUNG_URL",
"StadtlaufBS"."mvw_BasisDokument"."SEKTOR_TYP_BZ",
"StadtlaufBS"."mvw_BasisDokument"."POSITION_TYP_BZ",
"StadtlaufBS"."mvw_BasisDokument"."LIEFERART_BZ",
"StadtlaufBS"."mvw_BasisDokument"."LIEFERART_DSC",
"StadtlaufBS"."mvw_BasisAnlassSektoren"."SEKTOR_AKTIV_ID",
"StadtlaufBS"."mvw_BasisAnlassSektoren"."SEKTOR_SRT",
"StadtlaufBS"."mvw_BasisAnlassSektoren"."SEKTOR_CHEF_NM",
"StadtlaufBS"."mvw_BasisAnlassSektoren"."BESAMMLUNG_ZT",
"StadtlaufBS"."mvw_BasisAnlassSektoren"."BESAMMLUNG_ORT_ID",
"StadtlaufBS"."mvw_BasisAnlassSektoren"."POSITION_LIEFERUNG_ID",
"StadtlaufBS"."mvw_BasisAnlassSektoren"."PLAN_DISPOSITIV_URL",
"StadtlaufBS"."mvw_BasisAnlassSektoren"."PLAN_POSITIONEN_URL",
"StadtlaufBS"."mvw_BasisAnlassSektoren"."PLAN_BESAMMLUNG_URL",
"StadtlaufBS"."mvw_BasisAnlassSektoren"."PLAN_LIEFERORTE_URL",
"StadtlaufBS"."mvw_BasisAnlassSektoren"."SEKTOR_BZ",
"StadtlaufBS"."mvw_BasisAnlassSektoren"."SEKTOR_NM",
"StadtlaufBS"."mvw_BasisAnlassSektoren"."SEKTOR_ID",
"StadtlaufBS"."mvw_BasisAnlassSektoren"."AUSTRAGUNG_ID",
"StadtlaufBS"."mvw_BasisAnlassSektoren"."AUSTRAGUNG_DT",
"StadtlaufBS"."mvw_BasisAnlassSektoren"."AUSTRAGUNG_ZUS_DSC",
"StadtlaufBS"."mvw_BasisAnlassSektoren"."PLAN_VERKEHRSREGIME_URL",
"StadtlaufBS"."mvw_BasisAnlassSektoren"."ANLASS_ID",
"StadtlaufBS"."mvw_BasisAnlassSektoren"."ANLASS_NM",
"StadtlaufBS"."mvw_BasisAnlassSektoren"."ANLASS_DSC",
"StadtlaufBS"."mvw_BasisAnlassSektoren"."ANLASS_LOGO_URL",
"StadtlaufBS"."mvw_BasisAnlassSektoren"."POLIZEI_ABTEILUNG_NM",
"StadtlaufBS"."mvw_BasisAnlassSektoren"."POLIZEI_LOGO_URL",
"StadtlaufBS"."mvw_BasisAnlassSektoren"."DISPO_DOKU_TI",
"StadtlaufBS"."mvw_BasisPositionen"."POSITION_TX",
"StadtlaufBS"."mvw_BasisPositionen"."POSITION_NR",
"StadtlaufBS"."mvw_BasisPositionen"."POSITION_BZ",
"StadtlaufBS"."mvw_BasisPositionen"."POSITION_ID",
"StadtlaufBS"."mvw_BasisPositionen"."POSITION_DSC",
"StadtlaufBS"."mvw_BasisPositionen"."ORTSCHAFT_TX",
"StadtlaufBS"."mvw_BasisPositionen"."OERTLICHKEIT_TX",
"StadtlaufBS"."mvw_BasisPositionen"."ABSCHNITT_TX",
"StadtlaufBS"."mvw_BasisPositionen"."BEREIT_ZT",
"StadtlaufBS"."mvw_BasisPositionen"."SPERRE_AB_ZT",
"StadtlaufBS"."mvw_BasisPositionen"."SPERRE_BIS_ZT",
"StadtlaufBS"."mvw_BasisPositionen"."AUFTRAG_ANW",
"StadtlaufBS"."mvw_BasisPositionen"."MASSNAHME_ANW",
"StadtlaufBS"."mvw_BasisPositionen"."AUFBAU_ANW",
"StadtlaufBS"."mvw_BasisPositionen"."SITUATION_BILD_URL",
"StadtlaufBS"."mvw_BasisPositionen"."LIEFER_POS_ID"
FROM
"StadtlaufBS"."mvw_BasisDokument"
JOIN "StadtlaufBS"."mvw_BasisAnlassSektoren"    ON "StadtlaufBS"."mvw_BasisDokument"."SEKTOR_TYP_ID" = "StadtlaufBS"."mvw_BasisAnlassSektoren"."SEKTOR_TYP_ID"
JOIN "StadtlaufBS"."mvw_BasisPositionen"        ON "StadtlaufBS"."mvw_BasisDokument"."POSITION_TYP_ID" = "StadtlaufBS"."mvw_BasisPositionen"."POSITION_TYP_ID"
                                         AND "StadtlaufBS"."mvw_BasisAnlassSektoren"."SEKTOR_AKTIV_ID" = "StadtlaufBS"."mvw_BasisPositionen"."SEKTOR_AKTIV_ID";

----------------------------------------------------------
-- Helfer

-- Bedarf Besatzung
CREATE
MATERIALIZED VIEW "StadtlaufBS"."mvw_BesatzungBedarf" AS
SELECT
"StadtlaufBS"."mvw_BasisDokument"."DOKUMENT_ID",
"StadtlaufBS"."mvw_BasisDokument"."POSITION_TYP_ID",
"StadtlaufBS"."mvw_BasisDokument"."SEKTOR_TYP_ID",
"StadtlaufBS"."mvw_BasisDokument"."LIEFERART_ID",
"StadtlaufBS"."mvw_BasisDokument"."DOKUMENT_TI",
"StadtlaufBS"."mvw_BasisDokument"."DOKUMENT_PGM",
"StadtlaufBS"."mvw_BasisDokument"."DOKUMENT_ERGAENZUNG_URL",
"StadtlaufBS"."mvw_BasisDokument"."SEKTOR_TYP_BZ",
"StadtlaufBS"."mvw_BasisDokument"."POSITION_TYP_BZ",
"StadtlaufBS"."mvw_BasisDokument"."LIEFERART_BZ",
"StadtlaufBS"."mvw_BasisDokument"."LIEFERART_DSC",
"StadtlaufBS"."mvw_BasisAnlassSektoren"."SEKTOR_AKTIV_ID",
"StadtlaufBS"."mvw_BasisAnlassSektoren"."SEKTOR_SRT",
"StadtlaufBS"."mvw_BasisAnlassSektoren"."SEKTOR_CHEF_NM",
"StadtlaufBS"."mvw_BasisAnlassSektoren"."BESAMMLUNG_ZT",
"StadtlaufBS"."mvw_BasisAnlassSektoren"."BESAMMLUNG_ORT_ID",
"StadtlaufBS"."mvw_BasisAnlassSektoren"."POSITION_LIEFERUNG_ID",
"StadtlaufBS"."mvw_BasisAnlassSektoren"."PLAN_DISPOSITIV_URL",
"StadtlaufBS"."mvw_BasisAnlassSektoren"."PLAN_POSITIONEN_URL",
"StadtlaufBS"."mvw_BasisAnlassSektoren"."PLAN_BESAMMLUNG_URL",
"StadtlaufBS"."mvw_BasisAnlassSektoren"."PLAN_LIEFERORTE_URL",
"StadtlaufBS"."mvw_BasisAnlassSektoren"."SEKTOR_BZ",
"StadtlaufBS"."mvw_BasisAnlassSektoren"."SEKTOR_NM",
"StadtlaufBS"."mvw_BasisAnlassSektoren"."SEKTOR_ID",
"StadtlaufBS"."mvw_BasisAnlassSektoren"."AUSTRAGUNG_ID",
"StadtlaufBS"."mvw_BasisAnlassSektoren"."AUSTRAGUNG_DT",
"StadtlaufBS"."mvw_BasisAnlassSektoren"."AUSTRAGUNG_ZUS_DSC",
"StadtlaufBS"."mvw_BasisAnlassSektoren"."PLAN_VERKEHRSREGIME_URL",
"StadtlaufBS"."mvw_BasisAnlassSektoren"."ANLASS_ID",
"StadtlaufBS"."mvw_BasisAnlassSektoren"."ANLASS_NM",
"StadtlaufBS"."mvw_BasisAnlassSektoren"."ANLASS_DSC",
"StadtlaufBS"."mvw_BasisAnlassSektoren"."ANLASS_LOGO_URL",
"StadtlaufBS"."mvw_BasisAnlassSektoren"."POLIZEI_ABTEILUNG_NM",
"StadtlaufBS"."mvw_BasisAnlassSektoren"."POLIZEI_LOGO_URL",
"StadtlaufBS"."mvw_BasisAnlassSektoren"."DISPO_DOKU_TI",
"StadtlaufBS"."mvw_BasisPositionen"."POSITION_TX",
"StadtlaufBS"."mvw_BasisPositionen"."POSITION_NR",
"StadtlaufBS"."mvw_BasisPositionen"."POSITION_BZ",
"StadtlaufBS"."mvw_BasisPositionen"."POSITION_ID",
"StadtlaufBS"."mvw_BasisPositionen"."POSITION_DSC",
"StadtlaufBS"."mvw_BasisPositionen"."ORTSCHAFT_TX",
"StadtlaufBS"."mvw_BasisPositionen"."OERTLICHKEIT_TX",
"StadtlaufBS"."mvw_BasisPositionen"."ABSCHNITT_TX",
"StadtlaufBS"."mvw_BasisPositionen"."BEREIT_ZT",
"StadtlaufBS"."mvw_BasisPositionen"."SPERRE_AB_ZT",
"StadtlaufBS"."mvw_BasisPositionen"."SPERRE_BIS_ZT",
"StadtlaufBS"."mvw_BasisPositionen"."AUFTRAG_ANW",
"StadtlaufBS"."mvw_BasisPositionen"."MASSNAHME_ANW",
"StadtlaufBS"."mvw_BasisPositionen"."AUFBAU_ANW",
"StadtlaufBS"."mvw_BasisPositionen"."SITUATION_BILD_URL",
"StadtlaufBS"."mvw_BasisPositionen"."LIEFER_POS_ID",
"StadtlaufBS"."mvw_BasisBesatzung"."PERSONAL_TYP_ID",
"StadtlaufBS"."mvw_BasisBesatzung"."PERSONAL_TYP_BZ",
"StadtlaufBS"."mvw_BasisBesatzung"."PERSONAL_TYP_NM",
"StadtlaufBS"."mvw_BasisBesatzung"."PERSONAL_TYP_ICON_URL",
"StadtlaufBS"."mvw_BasisBesatzung"."BESATZUNG_ID",
"StadtlaufBS"."mvw_BasisBesatzung"."PERSONAL_AZ",
"StadtlaufBS"."mvw_BasisBesatzung"."AUFTRAG_SPZ_ANW"
FROM
"StadtlaufBS"."mvw_BasisDokument"
JOIN "StadtlaufBS"."mvw_BasisAnlassSektoren"    ON "StadtlaufBS"."mvw_BasisDokument"."SEKTOR_TYP_ID" = "StadtlaufBS"."mvw_BasisAnlassSektoren"."SEKTOR_TYP_ID"
JOIN "StadtlaufBS"."mvw_BasisPositionen"        ON "StadtlaufBS"."mvw_BasisDokument"."POSITION_TYP_ID" = "StadtlaufBS"."mvw_BasisPositionen"."POSITION_TYP_ID"
                                         AND "StadtlaufBS"."mvw_BasisAnlassSektoren"."SEKTOR_AKTIV_ID" = "StadtlaufBS"."mvw_BasisPositionen"."SEKTOR_AKTIV_ID"
JOIN "StadtlaufBS"."mvw_BasisBesatzung"         ON "StadtlaufBS"."mvw_BasisPositionen"."POSITION_ID" = "StadtlaufBS"."mvw_BasisBesatzung"."POSITION_ID";

-- Besatzungsbedarf-Liste
CREATE
MATERIALIZED VIEW "StadtlaufBS"."mvw_ReportBesatzungBedarf" AS
SELECT
    "xvw_ReportBesatzungBedarf"."LEVEL_SRT"                       AS "LEVEL_SRT",
    MAX("xvw_ReportBesatzungBedarf"."LEVEL")                      AS "MAX_LEVEL",
    MAX("xvw_ReportBesatzungBedarf"."LEVEL_LBL")                  AS "MAX_LEVEL_LBL",
    "xvw_ReportBesatzungBedarf"."LEVEL_RNK"                       AS "LEVEL_RNK",
    "xvw_ReportBesatzungBedarf"."DOKUMENT_ID"                     AS "DOKUMENT_ID",
    MAX("xvw_ReportBesatzungBedarf"."DOKUMENT_TI")                AS "MAX_DOKUMENT_TI",
    MAX("xvw_ReportBesatzungBedarf"."DOKUMENT_PGM")               AS "MAX_DOKUMENT_PGM",
    MAX("xvw_ReportBesatzungBedarf"."DOKUMENT_ERGAENZUNG_URL")    AS "MAX_DOKUMENT_ERGAENZUNG_URL",
    MAX("xvw_ReportBesatzungBedarf"."PERSONAL_TYP_ID_SRT")        AS "MAX_PERSONAL_TYP_ID_SRT",
    MAX("xvw_ReportBesatzungBedarf"."PERSONAL_TYP_BZ_SRT")        AS "MAX_PERSONAL_TYP_BZ_SRT",
    MAX("xvw_ReportBesatzungBedarf"."PERSONAL_TYP_NM_SRT")        AS "MAX_PERSONAL_TYP_NM_SRT",
    MAX("xvw_ReportBesatzungBedarf"."PERSONAL_TYP_ICON_URL_SRT")  AS "PERSONAL_TYP_ICON_URL_SRT",
    MAX("xvw_ReportBesatzungBedarf"."PERSONAL_TYP_LBL")           AS "MAX_PERSONAL_TYP_LBL",
    MAX("xvw_ReportBesatzungBedarf"."SEKTOR_TYP_BZ")              AS "MAX_SEKTOR_TYP_BZ",
    "xvw_ReportBesatzungBedarf"."SEKTOR_AKTIV_ID"                 AS "SEKTOR_AKTIV_ID",
    MAX("xvw_ReportBesatzungBedarf"."SEKTOR_SRT")                 AS "MAX_SEKTOR_SRT",
    MAX("xvw_ReportBesatzungBedarf"."SEKTOR_CHEF_NM")             AS "MAX_SEKTOR_CHEF_NM",
    MAX("xvw_ReportBesatzungBedarf"."BESAMMLUNG_ZT")              AS "MAX_BESAMMLUNG_ZT",
    MAX("xvw_ReportBesatzungBedarf"."BESAMMLUNG_ORT_ID")          AS "MAX_BESAMMLUNG_ORT_ID",
    MAX("xvw_ReportBesatzungBedarf"."PLAN_BESAMMLUNG_URL")        AS "MAX_PLAN_BESAMMLUNG_URL",
    "xvw_ReportBesatzungBedarf"."SEKTOR_BZ"                       AS "SEKTOR_BZ",
    MAX("xvw_ReportBesatzungBedarf"."SEKTOR_NM")                  AS "MAX_SEKTOR_NM",
    MAX("xvw_ReportBesatzungBedarf"."SEKTOR_ID")                  AS "MAX_SEKTOR_ID",
    "xvw_ReportBesatzungBedarf"."AUSTRAGUNG_ID"                   AS "AUSTRAGUNG_ID",
    MAX("xvw_ReportBesatzungBedarf"."AUSTRAGUNG_DT")              AS "MAX_AUSTRAGUNG_DT",
    MAX("xvw_ReportBesatzungBedarf"."AUSTRAGUNG_ZUS_DSC")         AS "MAX_AUSTRAGUNG_ZUS_DSC",
    "xvw_ReportBesatzungBedarf"."ANLASS_ID"                       AS "ANLASS_ID",
    MAX("xvw_ReportBesatzungBedarf"."ANLASS_NM")                  AS "MAX_ANLASS_NM",
    MAX("xvw_ReportBesatzungBedarf"."ANLASS_DSC")                 AS "MAX_ANLASS_DSC",
    MAX("xvw_ReportBesatzungBedarf"."ANLASS_LOGO_URL")            AS "MAX_ANLASS_LOGO_URL",
    MAX("xvw_ReportBesatzungBedarf"."POLIZEI_ABTEILUNG_NM")       AS "MAX_POLIZEI_ABTEILUNG_NM",
    MAX("xvw_ReportBesatzungBedarf"."POLIZEI_LOGO_URL")           AS "MAX_POLIZEI_LOGO_URL",
    MAX("xvw_ReportBesatzungBedarf"."DISPO_DOKU_TI")              AS "MAX_DISPO_DOKU_TI",
    MAX("xvw_ReportBesatzungBedarf"."POSITION_TYP_BZ")            AS "MAX_POSITION_TYP_BZ",
    MAX("xvw_ReportBesatzungBedarf"."POSITION_NR")                AS "POSITION_NR",
    CASE
     WHEN "LEVEL_SRT" = '3' AND "LEVEL_RNK" = '1' AND MAX("POSITION_NR") > 0
                                                   THEN  TO_CHAR(MAX("xvw_ReportBesatzungBedarf"."POSITION_NR"), '99')
     ELSE                                                ''
    END                                                           AS "MAX_POSITION_NR",
    MAX("xvw_ReportBesatzungBedarf"."POSITION_BZ")                AS "MAX_POSITION_BZ",
    "xvw_ReportBesatzungBedarf"."POSITION_ID"                     AS "POSITION_ID",
    MAX("xvw_ReportBesatzungBedarf"."ORTSCHAFT_TX")               AS "MAX_ORTSCHAFT_TX",
    MAX("xvw_ReportBesatzungBedarf"."OERTLICHKEIT_TX")            AS "MAX_OERTLICHKEIT_TX",
    MAX("xvw_ReportBesatzungBedarf"."ABSCHNITT_TX")               AS "MAX_ABSCHNITT_TX",
    MAX("xvw_ReportBesatzungBedarf"."BEREIT_ZT")                  AS "MAX_BEREIT_ZT",
    MAX("xvw_ReportBesatzungBedarf"."SPERRE_AB_ZT")               AS "MAX_SPERRE_AB_ZT",
    MAX("xvw_ReportBesatzungBedarf"."SPERRE_BIS_ZT")              AS "MAX_SPERRE_BIS_ZT",
    "xvw_ReportBesatzungBedarf"."PERSONAL_TYP_ID"                 AS "PERSONAL_TYP_ID",
    MAX("xvw_ReportBesatzungBedarf"."PERSONAL_TYP_BZ")            AS "MAX_PERSONAL_TYP_BZ",
    MAX("xvw_ReportBesatzungBedarf"."PERSONAL_TYP_NM")            AS "MAX_PERSONAL_TYP_NM",
    MAX("xvw_ReportBesatzungBedarf"."PERSONAL_TYP_ICON_URL")      AS "MAX_PERSONAL_TYP_ICON_URL",
    MAX("xvw_ReportBesatzungBedarf"."BESATZUNG_ID")               AS "MAX_BESATZUNG_ID",
    SUM("xvw_ReportBesatzungBedarf"."PERSONAL_AZ")                AS "SUM_PERSONAL_AZ",
    MAX("xvw_ReportBesatzungBedarf"."AUFTRAG_SPZ_ANW")            AS "MAX_AUFTRAG_SPZ_ANW"
FROM
(
SELECT
    '1'                           AS "LEVEL_SRT",
    'Gesamt'                      AS "LEVEL",
    'Bedarf für:'                 AS "LEVEL_LBL",
    '1'                           AS "LEVEL_RNK",
    "StadtlaufBS"."mvw_BesatzungBedarf"."DOKUMENT_ID",
    "StadtlaufBS"."mvw_BesatzungBedarf"."DOKUMENT_TI",
    "StadtlaufBS"."mvw_BesatzungBedarf"."DOKUMENT_PGM",
    "StadtlaufBS"."mvw_BesatzungBedarf"."DOKUMENT_ERGAENZUNG_URL",
    0                             AS "PERSONAL_TYP_ID_SRT",
    ''                            AS "PERSONAL_TYP_BZ_SRT",
    ''                            AS "PERSONAL_TYP_NM_SRT",
    ''                            AS "PERSONAL_TYP_ICON_URL_SRT",
    ''                            AS "PERSONAL_TYP_LBL",
    ''                            AS "SEKTOR_TYP_BZ",
    0                             AS "SEKTOR_AKTIV_ID",
    0                             AS "SEKTOR_SRT",
    ''                            AS "SEKTOR_CHEF_NM",
    MAKE_TIME(0, 0, 0.0)          AS "BESAMMLUNG_ZT",
    0                             AS "BESAMMLUNG_ORT_ID",
    ''                            AS "PLAN_BESAMMLUNG_URL",
    ''                            AS "SEKTOR_BZ",
    ''                            AS "SEKTOR_NM",
    0                             AS "SEKTOR_ID",
    "StadtlaufBS"."mvw_BesatzungBedarf"."AUSTRAGUNG_ID",
    "StadtlaufBS"."mvw_BesatzungBedarf"."AUSTRAGUNG_DT",
    "StadtlaufBS"."mvw_BesatzungBedarf"."AUSTRAGUNG_ZUS_DSC",
    "StadtlaufBS"."mvw_BesatzungBedarf"."ANLASS_ID",
    "StadtlaufBS"."mvw_BesatzungBedarf"."ANLASS_NM",
    "StadtlaufBS"."mvw_BesatzungBedarf"."ANLASS_DSC",
    "StadtlaufBS"."mvw_BesatzungBedarf"."ANLASS_LOGO_URL",
    "StadtlaufBS"."mvw_BesatzungBedarf"."POLIZEI_ABTEILUNG_NM",
    "StadtlaufBS"."mvw_BesatzungBedarf"."POLIZEI_LOGO_URL",
    "StadtlaufBS"."mvw_BesatzungBedarf"."DISPO_DOKU_TI",
    ''                            AS "POSITION_TYP_BZ",
    0                             AS "POSITION_NR",
    ''                            AS "POSITION_BZ",
    0                             AS "POSITION_ID",
    ''                            AS "ORTSCHAFT_TX",
    ''                            AS "OERTLICHKEIT_TX",
    ''                            AS "ABSCHNITT_TX",
    MAKE_TIME(0, 0, 0.0)          AS "BEREIT_ZT",
    MAKE_TIME(0, 0, 0.0)          AS "SPERRE_AB_ZT",
    MAKE_TIME(0, 0, 0.0)          AS "SPERRE_BIS_ZT",
    "StadtlaufBS"."mvw_BesatzungBedarf"."PERSONAL_TYP_ID",
    "StadtlaufBS"."mvw_BesatzungBedarf"."PERSONAL_TYP_BZ",
    "StadtlaufBS"."mvw_BesatzungBedarf"."PERSONAL_TYP_NM",
    "StadtlaufBS"."mvw_BesatzungBedarf"."PERSONAL_TYP_ICON_URL",
    "StadtlaufBS"."mvw_BesatzungBedarf"."BESATZUNG_ID",
    "StadtlaufBS"."mvw_BesatzungBedarf"."PERSONAL_AZ",
    "StadtlaufBS"."mvw_BesatzungBedarf"."AUFTRAG_SPZ_ANW"
  FROM "StadtlaufBS"."mvw_BesatzungBedarf"
UNION
SELECT
    '2'                           AS "LEVEL_SRT",
    'Sektoren'                    AS "LEVEL",
    'Bedarf für:'                 AS "LEVEL_LBL",
    '1'                           AS "LEVEL_RNK",
    "StadtlaufBS"."mvw_BesatzungBedarf"."DOKUMENT_ID",
    "StadtlaufBS"."mvw_BesatzungBedarf"."DOKUMENT_TI",
    "StadtlaufBS"."mvw_BesatzungBedarf"."DOKUMENT_PGM",
    "StadtlaufBS"."mvw_BesatzungBedarf"."DOKUMENT_ERGAENZUNG_URL",
    0                             AS "PERSONAL_TYP_ID_SRT",
    ''                            AS "PERSONAL_TYP_BZ_SRT",
    ''                            AS "PERSONAL_TYP_NM_SRT",
    ''                            AS "PERSONAL_TYP_ICON_URL_SRT",
    ''                            AS "PERSONAL_TYP_LBL",
    "StadtlaufBS"."mvw_BesatzungBedarf"."SEKTOR_TYP_BZ",
    0                             AS "SEKTOR_AKTIV_ID",
    0                             AS "SEKTOR_SRT",
    ''                            AS "SEKTOR_CHEF_NM",
    MAKE_TIME(0, 0, 0.0)          AS "BESAMMLUNG_ZT",
    0                             AS "BESAMMLUNG_ORT_ID",
    ''                            AS "PLAN_BESAMMLUNG_URL",
    "StadtlaufBS"."mvw_BesatzungBedarf"."SEKTOR_BZ",
    ''                            AS "SEKTOR_NM",
    0                             AS "SEKTOR_ID",
    "StadtlaufBS"."mvw_BesatzungBedarf"."AUSTRAGUNG_ID",
    "StadtlaufBS"."mvw_BesatzungBedarf"."AUSTRAGUNG_DT",
    "StadtlaufBS"."mvw_BesatzungBedarf"."AUSTRAGUNG_ZUS_DSC",
    "StadtlaufBS"."mvw_BesatzungBedarf"."ANLASS_ID",
    "StadtlaufBS"."mvw_BesatzungBedarf"."ANLASS_NM",
    "StadtlaufBS"."mvw_BesatzungBedarf"."ANLASS_DSC",
    "StadtlaufBS"."mvw_BesatzungBedarf"."ANLASS_LOGO_URL",
    "StadtlaufBS"."mvw_BesatzungBedarf"."POLIZEI_ABTEILUNG_NM",
    "StadtlaufBS"."mvw_BesatzungBedarf"."POLIZEI_LOGO_URL",
    "StadtlaufBS"."mvw_BesatzungBedarf"."DISPO_DOKU_TI",
    ''                            AS "POSITION_TYP_BZ",
    0                             AS "POSITION_NR",
    ''                            AS "POSITION_BZ",
    0                             AS "POSITION_ID",
    ''                            AS "ORTSCHAFT_TX",
    ''                            AS "OERTLICHKEIT_TX",
    ''                            AS "ABSCHNITT_TX",
    MAKE_TIME(0, 0, 0.0)          AS "BEREIT_ZT",
    MAKE_TIME(0, 0, 0.0)          AS "SPERRE_AB_ZT",
    MAKE_TIME(0, 0, 0.0)          AS "SPERRE_BIS_ZT",
    "StadtlaufBS"."mvw_BesatzungBedarf"."PERSONAL_TYP_ID",
    "StadtlaufBS"."mvw_BesatzungBedarf"."PERSONAL_TYP_BZ",
    "StadtlaufBS"."mvw_BesatzungBedarf"."PERSONAL_TYP_NM",
    "StadtlaufBS"."mvw_BesatzungBedarf"."PERSONAL_TYP_ICON_URL",
    "StadtlaufBS"."mvw_BesatzungBedarf"."BESATZUNG_ID",
    "StadtlaufBS"."mvw_BesatzungBedarf"."PERSONAL_AZ",
    "StadtlaufBS"."mvw_BesatzungBedarf"."AUFTRAG_SPZ_ANW"
  FROM "StadtlaufBS"."mvw_BesatzungBedarf"
UNION
SELECT
    '3'                           AS "LEVEL_SRT",
    'Positionen'                  AS "LEVEL",
    'Bedarf für:'                 AS "LEVEL_LBL",
    '1'                           AS "LEVEL_RNK",
    "StadtlaufBS"."mvw_BesatzungBedarf"."DOKUMENT_ID",
    "StadtlaufBS"."mvw_BesatzungBedarf"."DOKUMENT_TI",
    "StadtlaufBS"."mvw_BesatzungBedarf"."DOKUMENT_PGM",
    "StadtlaufBS"."mvw_BesatzungBedarf"."DOKUMENT_ERGAENZUNG_URL",
    "StadtlaufBS"."mvw_BesatzungBedarf"."PERSONAL_TYP_ID"         AS "PERSONAL_TYP_ID_SRT",
    "StadtlaufBS"."mvw_BesatzungBedarf"."PERSONAL_TYP_BZ"         AS "PERSONAL_TYP_BZ_SRT",
    "StadtlaufBS"."mvw_BesatzungBedarf"."PERSONAL_TYP_NM"         AS "PERSONAL_TYP_NM_SRT",
    "StadtlaufBS"."mvw_BesatzungBedarf"."PERSONAL_TYP_ICON_URL"   AS "PERSONAL_TYP_ICON_URL_SRT",
    'Helfer'                   AS "PERSONAL_TYP_LBL",
    "StadtlaufBS"."mvw_BesatzungBedarf"."SEKTOR_TYP_BZ",
    "StadtlaufBS"."mvw_BesatzungBedarf"."SEKTOR_AKTIV_ID",
    "StadtlaufBS"."mvw_BesatzungBedarf"."SEKTOR_SRT",
    "StadtlaufBS"."mvw_BesatzungBedarf"."SEKTOR_CHEF_NM",
    "StadtlaufBS"."mvw_BesatzungBedarf"."BESAMMLUNG_ZT",
    "StadtlaufBS"."mvw_BesatzungBedarf"."BESAMMLUNG_ORT_ID",
    "StadtlaufBS"."mvw_BesatzungBedarf"."PLAN_BESAMMLUNG_URL",
    "StadtlaufBS"."mvw_BesatzungBedarf"."SEKTOR_BZ",
    "StadtlaufBS"."mvw_BesatzungBedarf"."SEKTOR_NM",
    "StadtlaufBS"."mvw_BesatzungBedarf"."SEKTOR_ID",
    "StadtlaufBS"."mvw_BesatzungBedarf"."AUSTRAGUNG_ID",
    "StadtlaufBS"."mvw_BesatzungBedarf"."AUSTRAGUNG_DT",
    "StadtlaufBS"."mvw_BesatzungBedarf"."AUSTRAGUNG_ZUS_DSC",
    "StadtlaufBS"."mvw_BesatzungBedarf"."ANLASS_ID",
    "StadtlaufBS"."mvw_BesatzungBedarf"."ANLASS_NM",
    "StadtlaufBS"."mvw_BesatzungBedarf"."ANLASS_DSC",
    "StadtlaufBS"."mvw_BesatzungBedarf"."ANLASS_LOGO_URL",
    "StadtlaufBS"."mvw_BesatzungBedarf"."POLIZEI_ABTEILUNG_NM",
    "StadtlaufBS"."mvw_BesatzungBedarf"."POLIZEI_LOGO_URL",
    "StadtlaufBS"."mvw_BesatzungBedarf"."DISPO_DOKU_TI",
    "StadtlaufBS"."mvw_BesatzungBedarf"."POSITION_TYP_BZ",
    "StadtlaufBS"."mvw_BesatzungBedarf"."POSITION_NR",
    "StadtlaufBS"."mvw_BesatzungBedarf"."POSITION_BZ",
    "StadtlaufBS"."mvw_BesatzungBedarf"."POSITION_ID",
    "StadtlaufBS"."mvw_BesatzungBedarf"."ORTSCHAFT_TX",
    "StadtlaufBS"."mvw_BesatzungBedarf"."OERTLICHKEIT_TX",
    "StadtlaufBS"."mvw_BesatzungBedarf"."ABSCHNITT_TX",
    "StadtlaufBS"."mvw_BesatzungBedarf"."BEREIT_ZT",
    "StadtlaufBS"."mvw_BesatzungBedarf"."SPERRE_AB_ZT",
    "StadtlaufBS"."mvw_BesatzungBedarf"."SPERRE_BIS_ZT",
    "StadtlaufBS"."mvw_BesatzungBedarf"."PERSONAL_TYP_ID",
    "StadtlaufBS"."mvw_BesatzungBedarf"."PERSONAL_TYP_BZ",
    "StadtlaufBS"."mvw_BesatzungBedarf"."PERSONAL_TYP_NM",
    "StadtlaufBS"."mvw_BesatzungBedarf"."PERSONAL_TYP_ICON_URL",
    "StadtlaufBS"."mvw_BesatzungBedarf"."BESATZUNG_ID",
    "StadtlaufBS"."mvw_BesatzungBedarf"."PERSONAL_AZ",
    "StadtlaufBS"."mvw_BesatzungBedarf"."AUFTRAG_SPZ_ANW"
  FROM "StadtlaufBS"."mvw_BesatzungBedarf"
)
AS "xvw_ReportBesatzungBedarf"
GROUP BY
    "xvw_ReportBesatzungBedarf"."ANLASS_ID",
    "xvw_ReportBesatzungBedarf"."AUSTRAGUNG_ID",
    "xvw_ReportBesatzungBedarf"."LEVEL_SRT",
    "xvw_ReportBesatzungBedarf"."LEVEL_RNK",
    "xvw_ReportBesatzungBedarf"."SEKTOR_AKTIV_ID",
    "xvw_ReportBesatzungBedarf"."SEKTOR_BZ",
    "xvw_ReportBesatzungBedarf"."POSITION_ID",
    "xvw_ReportBesatzungBedarf"."PERSONAL_TYP_ID",
    "xvw_ReportBesatzungBedarf"."DOKUMENT_ID"
ORDER BY
    "MAX_ANLASS_NM",
    "xvw_ReportBesatzungBedarf"."ANLASS_ID",
    "MAX_AUSTRAGUNG_DT",
    "xvw_ReportBesatzungBedarf"."AUSTRAGUNG_ID",
    "MAX_PERSONAL_TYP_BZ_SRT",
    "MAX_PERSONAL_TYP_ID_SRT",
    "MAX_SEKTOR_SRT",
    "SEKTOR_BZ",
    "xvw_ReportBesatzungBedarf"."SEKTOR_AKTIV_ID",
    "xvw_ReportBesatzungBedarf"."LEVEL_SRT",
    "xvw_ReportBesatzungBedarf"."LEVEL_RNK",
    "MAX_POSITION_NR",
    "xvw_ReportBesatzungBedarf"."POSITION_ID",
    "MAX_PERSONAL_TYP_BZ",
    "xvw_ReportBesatzungBedarf"."PERSONAL_TYP_ID",
    "xvw_ReportBesatzungBedarf"."DOKUMENT_ID";

-- Bedarf Besatzung/Helfer
CREATE
MATERIALIZED VIEW "StadtlaufBS"."mvw_BesatzungHelferBedarf" AS
SELECT
"StadtlaufBS"."mvw_BesatzungBedarf"."DOKUMENT_ID",
"StadtlaufBS"."mvw_BesatzungBedarf"."POSITION_TYP_ID",
"StadtlaufBS"."mvw_BesatzungBedarf"."SEKTOR_TYP_ID",
"StadtlaufBS"."mvw_BesatzungBedarf"."LIEFERART_ID",
"StadtlaufBS"."mvw_BesatzungBedarf"."DOKUMENT_TI",
"StadtlaufBS"."mvw_BesatzungBedarf"."DOKUMENT_PGM",
"StadtlaufBS"."mvw_BesatzungBedarf"."DOKUMENT_ERGAENZUNG_URL",
"StadtlaufBS"."mvw_BesatzungBedarf"."SEKTOR_TYP_BZ",
"StadtlaufBS"."mvw_BesatzungBedarf"."POSITION_TYP_BZ",
"StadtlaufBS"."mvw_BesatzungBedarf"."LIEFERART_BZ",
"StadtlaufBS"."mvw_BesatzungBedarf"."LIEFERART_DSC",
"StadtlaufBS"."mvw_BesatzungBedarf"."SEKTOR_AKTIV_ID",
"StadtlaufBS"."mvw_BesatzungBedarf"."SEKTOR_SRT",
"StadtlaufBS"."mvw_BesatzungBedarf"."SEKTOR_CHEF_NM",
"StadtlaufBS"."mvw_BesatzungBedarf"."BESAMMLUNG_ZT",
"StadtlaufBS"."mvw_BesatzungBedarf"."BESAMMLUNG_ORT_ID",
"StadtlaufBS"."mvw_BesatzungBedarf"."POSITION_LIEFERUNG_ID",
"StadtlaufBS"."mvw_BesatzungBedarf"."PLAN_DISPOSITIV_URL",
"StadtlaufBS"."mvw_BesatzungBedarf"."PLAN_POSITIONEN_URL",
"StadtlaufBS"."mvw_BesatzungBedarf"."PLAN_BESAMMLUNG_URL",
"StadtlaufBS"."mvw_BesatzungBedarf"."PLAN_LIEFERORTE_URL",
"StadtlaufBS"."mvw_BesatzungBedarf"."SEKTOR_BZ",
"StadtlaufBS"."mvw_BesatzungBedarf"."SEKTOR_NM",
"StadtlaufBS"."mvw_BesatzungBedarf"."SEKTOR_ID",
"StadtlaufBS"."mvw_BesatzungBedarf"."AUSTRAGUNG_ID",
"StadtlaufBS"."mvw_BesatzungBedarf"."AUSTRAGUNG_DT",
"StadtlaufBS"."mvw_BesatzungBedarf"."AUSTRAGUNG_ZUS_DSC",
"StadtlaufBS"."mvw_BesatzungBedarf"."PLAN_VERKEHRSREGIME_URL",
"StadtlaufBS"."mvw_BesatzungBedarf"."ANLASS_ID",
"StadtlaufBS"."mvw_BesatzungBedarf"."ANLASS_NM",
"StadtlaufBS"."mvw_BesatzungBedarf"."ANLASS_DSC",
"StadtlaufBS"."mvw_BesatzungBedarf"."ANLASS_LOGO_URL",
"StadtlaufBS"."mvw_BesatzungBedarf"."POLIZEI_ABTEILUNG_NM",
"StadtlaufBS"."mvw_BesatzungBedarf"."POLIZEI_LOGO_URL",
"StadtlaufBS"."mvw_BesatzungBedarf"."DISPO_DOKU_TI",
"StadtlaufBS"."mvw_BesatzungBedarf"."POSITION_TX",
"StadtlaufBS"."mvw_BesatzungBedarf"."POSITION_NR",
"StadtlaufBS"."mvw_BesatzungBedarf"."POSITION_BZ",
"StadtlaufBS"."mvw_BesatzungBedarf"."POSITION_ID",
"StadtlaufBS"."mvw_BesatzungBedarf"."POSITION_DSC",
"StadtlaufBS"."mvw_BesatzungBedarf"."ORTSCHAFT_TX",
"StadtlaufBS"."mvw_BesatzungBedarf"."OERTLICHKEIT_TX",
"StadtlaufBS"."mvw_BesatzungBedarf"."ABSCHNITT_TX",
"StadtlaufBS"."mvw_BesatzungBedarf"."BEREIT_ZT",
"StadtlaufBS"."mvw_BesatzungBedarf"."SPERRE_AB_ZT",
"StadtlaufBS"."mvw_BesatzungBedarf"."SPERRE_BIS_ZT",
"StadtlaufBS"."mvw_BesatzungBedarf"."AUFTRAG_ANW",
"StadtlaufBS"."mvw_BesatzungBedarf"."MASSNAHME_ANW",
"StadtlaufBS"."mvw_BesatzungBedarf"."AUFBAU_ANW",
"StadtlaufBS"."mvw_BesatzungBedarf"."SITUATION_BILD_URL",
"StadtlaufBS"."mvw_BesatzungBedarf"."LIEFER_POS_ID",
"StadtlaufBS"."mvw_BesatzungBedarf"."PERSONAL_TYP_ID",
"StadtlaufBS"."mvw_BesatzungBedarf"."PERSONAL_TYP_BZ",
"StadtlaufBS"."mvw_BesatzungBedarf"."PERSONAL_TYP_NM",
"StadtlaufBS"."mvw_BesatzungBedarf"."PERSONAL_TYP_ICON_URL",
"StadtlaufBS"."mvw_BesatzungBedarf"."BESATZUNG_ID",
"StadtlaufBS"."mvw_BesatzungBedarf"."PERSONAL_AZ",
"StadtlaufBS"."mvw_BesatzungBedarf"."AUFTRAG_SPZ_ANW",
"StadtlaufBS"."mvw_BasisBesatzungHelfer"."EINSATZ_VON_ZT",
"StadtlaufBS"."mvw_BasisBesatzungHelfer"."EINSATZ_BIS_ZT",
"StadtlaufBS"."mvw_BasisBesatzungHelfer"."AUFTRAG_ZUS_ANW",
"StadtlaufBS"."mvw_BasisBesatzungHelfer"."HELFER_ID",
"StadtlaufBS"."mvw_BasisBesatzungHelfer"."HELFER_NM",
"StadtlaufBS"."mvw_BasisBesatzungHelfer"."HELFER_EMAIL_ADR",
"StadtlaufBS"."mvw_BasisBesatzungHelfer"."HELFER_TEL_NR",
"StadtlaufBS"."mvw_BasisBesatzungHelfer"."HELFER_AZ"
FROM
"StadtlaufBS"."mvw_BesatzungBedarf"
JOIN "StadtlaufBS"."mvw_BasisBesatzungHelfer"   ON "StadtlaufBS"."mvw_BesatzungBedarf"."BESATZUNG_ID" = "StadtlaufBS"."mvw_BasisBesatzungHelfer"."BESATZUNG_ID";

----------------------------------------------------------
-- Material

-- Liefer-Sektor
CREATE
MATERIALIZED VIEW "StadtlaufBS"."mvw_BlfrgAnlassSektoren" AS
SELECT
"StadtlaufBS"."mvw_BasisAnlassSektoren"."SEKTOR_AKTIV_ID",
"StadtlaufBS"."mvw_BasisAnlassSektoren"."SEKTOR_SRT",
"StadtlaufBS"."mvw_BasisAnlassSektoren"."SEKTOR_CHEF_NM",
"StadtlaufBS"."mvw_BasisAnlassSektoren"."BESAMMLUNG_ZT",
"StadtlaufBS"."mvw_BasisAnlassSektoren"."BESAMMLUNG_ORT_ID",
"StadtlaufBS"."mvw_BasisAnlassSektoren"."POSITION_LIEFERUNG_ID",
"StadtlaufBS"."mvw_BasisAnlassSektoren"."PLAN_DISPOSITIV_URL",
"StadtlaufBS"."mvw_BasisAnlassSektoren"."PLAN_POSITIONEN_URL",
"StadtlaufBS"."mvw_BasisAnlassSektoren"."PLAN_BESAMMLUNG_URL",
"StadtlaufBS"."mvw_BasisAnlassSektoren"."PLAN_LIEFERORTE_URL",
"StadtlaufBS"."mvw_BasisAnlassSektoren"."SEKTOR_BZ",
"StadtlaufBS"."mvw_BasisAnlassSektoren"."SEKTOR_NM",
"StadtlaufBS"."mvw_BasisAnlassSektoren"."SEKTOR_ID",
"StadtlaufBS"."mvw_BasisAnlassSektoren"."SEKTOR_TYP_ID",
"StadtlaufBS"."mvw_BasisAnlassSektoren"."SEKTOR_TYP_BZ",
"StadtlaufBS"."mvw_BasisAnlassSektoren"."AUSTRAGUNG_ID",
"StadtlaufBS"."mvw_BasisAnlassSektoren"."AUSTRAGUNG_DT",
"StadtlaufBS"."mvw_BasisAnlassSektoren"."AUSTRAGUNG_ZUS_DSC",
"StadtlaufBS"."mvw_BasisAnlassSektoren"."PLAN_VERKEHRSREGIME_URL",
"StadtlaufBS"."mvw_BasisAnlassSektoren"."ANLASS_ID",
"StadtlaufBS"."mvw_BasisAnlassSektoren"."ANLASS_NM",
"StadtlaufBS"."mvw_BasisAnlassSektoren"."ANLASS_DSC",
"StadtlaufBS"."mvw_BasisAnlassSektoren"."ANLASS_LOGO_URL",
"StadtlaufBS"."mvw_BasisAnlassSektoren"."POLIZEI_ABTEILUNG_NM",
"StadtlaufBS"."mvw_BasisAnlassSektoren"."POLIZEI_LOGO_URL",
"StadtlaufBS"."mvw_BasisAnlassSektoren"."DISPO_DOKU_TI",
"StadtlaufBS"."BELIEFERUNG"."LFRG_SEKTOR_MAT_JN",
"DispoSekt"."SEKTOR_AKTIV_ID"         AS "SEKTOR_AKTIV_ID_DISPO",
"DispoSekt"."SEKTOR_SRT"              AS "SEKTOR_SRT_DISPO",
"DispoSekt"."SEKTOR_CHEF_NM"          AS "SEKTOR_CHEF_NM_DISPO",
"DispoSekt"."BESAMMLUNG_ZT"           AS "BESAMMLUNG_ZT_DISPO",
"DispoSekt"."BESAMMLUNG_ORT_ID"       AS "BESAMMLUNG_ORT_ID_DISPO",
"DispoSekt"."POSITION_LIEFERUNG_ID"   AS "POSITION_LIEFERUNG_ID_DISPO",
"DispoSekt"."PLAN_DISPOSITIV_URL"     AS "PLAN_DISPOSITIV_URL_DISPO",
"DispoSekt"."PLAN_POSITIONEN_URL"     AS "PLAN_POSITIONEN_URL_DISPO",
"DispoSekt"."PLAN_BESAMMLUNG_URL"     AS "PLAN_BESAMMLUNG_URL_DISPO",
"DispoSekt"."PLAN_LIEFERORTE_URL"     AS "PLAN_LIEFERORTE_URL_DISPO",
"DispoSekt"."SEKTOR_BZ"               AS "SEKTOR_BZ_DISPO",
"DispoSekt"."SEKTOR_NM"               AS "SEKTOR_NM_DISPO",
"DispoSekt"."SEKTOR_ID"               AS "SEKTOR_ID_DISPO",
"DispoSekt"."SEKTOR_TYP_ID"           AS "SEKTOR_TYP_ID_DISPO",
"DispoSekt"."SEKTOR_TYP_BZ"           AS "SEKTOR_TYP_BZ_DISPO"
FROM
"StadtlaufBS"."mvw_BasisAnlassSektoren"
JOIN "StadtlaufBS"."BELIEFERUNG"                             ON "StadtlaufBS"."mvw_BasisAnlassSektoren"."SEKTOR_AKTIV_ID" = "StadtlaufBS"."BELIEFERUNG"."SEKTOR_AKTIV_ID_LFRG"
JOIN "StadtlaufBS"."mvw_BasisAnlassSektoren" AS "DispoSekt"  ON "StadtlaufBS"."BELIEFERUNG"."SEKTOR_AKTIV_ID_DISPO" = "DispoSekt"."SEKTOR_AKTIV_ID";

-- Liefer-Position
CREATE
MATERIALIZED VIEW "StadtlaufBS"."mvw_BlfrgPositionen" AS
SELECT
"StadtlaufBS"."mvw_BasisPositionen"."POSITION_TX",
"StadtlaufBS"."mvw_BasisPositionen"."POSITION_NR",
"StadtlaufBS"."mvw_BasisPositionen"."POSITION_BZ",
"StadtlaufBS"."mvw_BasisPositionen"."SEKTOR_AKTIV_ID",
"StadtlaufBS"."mvw_BasisPositionen"."POSITION_ID",
"StadtlaufBS"."mvw_BasisPositionen"."POSITION_DSC",
"StadtlaufBS"."mvw_BasisPositionen"."ORTSCHAFT_TX",
"StadtlaufBS"."mvw_BasisPositionen"."OERTLICHKEIT_TX",
"StadtlaufBS"."mvw_BasisPositionen"."ABSCHNITT_TX",
"StadtlaufBS"."mvw_BasisPositionen"."BEREIT_ZT",
"StadtlaufBS"."mvw_BasisPositionen"."SPERRE_AB_ZT",
"StadtlaufBS"."mvw_BasisPositionen"."SPERRE_BIS_ZT",
"StadtlaufBS"."mvw_BasisPositionen"."AUFTRAG_ANW",
"StadtlaufBS"."mvw_BasisPositionen"."MASSNAHME_ANW",
"StadtlaufBS"."mvw_BasisPositionen"."AUFBAU_ANW",
"StadtlaufBS"."mvw_BasisPositionen"."SITUATION_BILD_URL",
"StadtlaufBS"."mvw_BasisPositionen"."LIEFER_POS_ID",
"StadtlaufBS"."mvw_BasisPositionen"."POSITION_TYP_ID",
"StadtlaufBS"."mvw_BasisPositionen"."POSITION_TYP_BZ",
"DispoPos"."POSITION_NR"        AS "POSITION_NR_DISPO",
"DispoPos"."POSITION_BZ"        AS "POSITION_BZ_DISPO",
"DispoPos"."SEKTOR_AKTIV_ID"    AS "SEKTOR_AKTIV_ID_DISPO",
"DispoPos"."POSITION_ID"        AS "POSITION_ID_DISPO",
"DispoPos"."POSITION_DSC"       AS "POSITION_DSC_DISPO",
"DispoPos"."ORTSCHAFT_TX"       AS "ORTSCHAFT_TX_DISPO",
"DispoPos"."OERTLICHKEIT_TX"    AS "OERTLICHKEIT_TX_DISPO",
"DispoPos"."ABSCHNITT_TX"       AS "ABSCHNITT_TX_DISPO",
"DispoPos"."LIEFER_POS_ID"      AS "LIEFER_POS_ID_DISPO",
"DispoPos"."POSITION_TYP_ID"    AS "POSITION_TYP_ID_DISPO",
"DispoPos"."POSITION_TYP_BZ"    AS "POSITION_TYP_BZ_DISPO"
FROM
"StadtlaufBS"."mvw_BasisPositionen"
LEFT JOIN "StadtlaufBS"."mvw_BasisPositionen" AS "DispoPos"   ON "StadtlaufBS"."mvw_BasisPositionen"."POSITION_ID" = "DispoPos"."LIEFER_POS_ID";

-- Liefer-Position Dispo-Positionen
CREATE
MATERIALIZED VIEW "StadtlaufBS"."mvw_BlfrgDispoPos" AS
SELECT
"StadtlaufBS"."mvw_BasisDokument"."DOKUMENT_ID",
"StadtlaufBS"."mvw_BasisDokument"."POSITION_TYP_ID",
"StadtlaufBS"."mvw_BasisDokument"."SEKTOR_TYP_ID",
"StadtlaufBS"."mvw_BasisDokument"."LIEFERART_ID",
"StadtlaufBS"."mvw_BasisDokument"."DOKUMENT_TI",
"StadtlaufBS"."mvw_BasisDokument"."DOKUMENT_PGM",
"StadtlaufBS"."mvw_BasisDokument"."DOKUMENT_ERGAENZUNG_URL",
"StadtlaufBS"."mvw_BasisDokument"."SEKTOR_TYP_BZ",
"StadtlaufBS"."mvw_BasisDokument"."POSITION_TYP_BZ",
"StadtlaufBS"."mvw_BasisDokument"."LIEFERART_BZ",
"StadtlaufBS"."mvw_BasisDokument"."LIEFERART_DSC",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."SEKTOR_AKTIV_ID",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."SEKTOR_SRT",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."SEKTOR_CHEF_NM",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."BESAMMLUNG_ZT",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."BESAMMLUNG_ORT_ID",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."POSITION_LIEFERUNG_ID",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."PLAN_DISPOSITIV_URL",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."PLAN_POSITIONEN_URL",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."PLAN_BESAMMLUNG_URL",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."PLAN_LIEFERORTE_URL",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."SEKTOR_BZ",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."SEKTOR_NM",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."SEKTOR_ID",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."AUSTRAGUNG_ID",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."AUSTRAGUNG_DT",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."AUSTRAGUNG_ZUS_DSC",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."PLAN_VERKEHRSREGIME_URL",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."ANLASS_ID",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."ANLASS_NM",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."ANLASS_DSC",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."ANLASS_LOGO_URL",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."POLIZEI_ABTEILUNG_NM",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."POLIZEI_LOGO_URL",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."DISPO_DOKU_TI",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."LFRG_SEKTOR_MAT_JN",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."SEKTOR_AKTIV_ID_DISPO",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."SEKTOR_SRT_DISPO",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."SEKTOR_CHEF_NM_DISPO",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."BESAMMLUNG_ZT_DISPO",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."BESAMMLUNG_ORT_ID_DISPO",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."POSITION_LIEFERUNG_ID_DISPO",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."PLAN_DISPOSITIV_URL_DISPO",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."PLAN_POSITIONEN_URL_DISPO",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."PLAN_BESAMMLUNG_URL_DISPO",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."PLAN_LIEFERORTE_URL_DISPO",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."SEKTOR_BZ_DISPO",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."SEKTOR_NM_DISPO",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."SEKTOR_ID_DISPO",
"StadtlaufBS"."mvw_BlfrgPositionen"."POSITION_TX",
"StadtlaufBS"."mvw_BlfrgPositionen"."POSITION_BZ",
"StadtlaufBS"."mvw_BlfrgPositionen"."POSITION_ID",
"StadtlaufBS"."mvw_BlfrgPositionen"."POSITION_DSC",
"StadtlaufBS"."mvw_BlfrgPositionen"."ORTSCHAFT_TX",
"StadtlaufBS"."mvw_BlfrgPositionen"."OERTLICHKEIT_TX",
"StadtlaufBS"."mvw_BlfrgPositionen"."ABSCHNITT_TX",
"StadtlaufBS"."mvw_BlfrgPositionen"."BEREIT_ZT",
"StadtlaufBS"."mvw_BlfrgPositionen"."SPERRE_AB_ZT",
"StadtlaufBS"."mvw_BlfrgPositionen"."SPERRE_BIS_ZT",
"StadtlaufBS"."mvw_BlfrgPositionen"."AUFTRAG_ANW",
"StadtlaufBS"."mvw_BlfrgPositionen"."MASSNAHME_ANW",
"StadtlaufBS"."mvw_BlfrgPositionen"."AUFBAU_ANW",
"StadtlaufBS"."mvw_BlfrgPositionen"."SITUATION_BILD_URL",
"StadtlaufBS"."mvw_BlfrgPositionen"."POSITION_NR_DISPO",
"StadtlaufBS"."mvw_BlfrgPositionen"."POSITION_BZ_DISPO",
"StadtlaufBS"."mvw_BlfrgPositionen"."POSITION_ID_DISPO",
0                                                             AS "VORSIGNAL_ID",
"StadtlaufBS"."mvw_BlfrgPositionen"."POSITION_DSC_DISPO",
"StadtlaufBS"."mvw_BlfrgPositionen"."ORTSCHAFT_TX_DISPO",
"StadtlaufBS"."mvw_BlfrgPositionen"."OERTLICHKEIT_TX_DISPO",
"StadtlaufBS"."mvw_BlfrgPositionen"."ABSCHNITT_TX_DISPO",
"StadtlaufBS"."mvw_BlfrgPositionen"."LIEFER_POS_ID_DISPO",
"StadtlaufBS"."mvw_BlfrgPositionen"."POSITION_TYP_ID_DISPO",
"StadtlaufBS"."mvw_BlfrgPositionen"."POSITION_TYP_BZ_DISPO",
"StadtlaufBS"."mvw_BasisAusruestung"."MATERIAL_ID",
"StadtlaufBS"."mvw_BasisAusruestung"."MATERIAL_BZ",
"StadtlaufBS"."mvw_BasisAusruestung"."MATERIAL_NM",
"StadtlaufBS"."mvw_BasisAusruestung"."MATERIAL_ICON_URL",
"StadtlaufBS"."mvw_BasisAusruestung"."AUSRUESTUNG_AZ"
FROM
"StadtlaufBS"."mvw_BasisDokument"
JOIN "StadtlaufBS"."mvw_BlfrgAnlassSektoren"    ON "StadtlaufBS"."mvw_BasisDokument"."SEKTOR_TYP_ID" = "StadtlaufBS"."mvw_BlfrgAnlassSektoren"."SEKTOR_TYP_ID"
JOIN "StadtlaufBS"."mvw_BlfrgPositionen"        ON "StadtlaufBS"."mvw_BasisDokument"."POSITION_TYP_ID" = "StadtlaufBS"."mvw_BlfrgPositionen"."POSITION_TYP_ID"
                                         AND "StadtlaufBS"."mvw_BlfrgAnlassSektoren"."SEKTOR_AKTIV_ID_DISPO" = "StadtlaufBS"."mvw_BlfrgPositionen"."SEKTOR_AKTIV_ID"
JOIN "StadtlaufBS"."mvw_BasisAusruestung"       ON "StadtlaufBS"."mvw_BasisDokument"."LIEFERART_ID" = "StadtlaufBS"."mvw_BasisAusruestung"."LIEFERART_ID"
                                         AND "StadtlaufBS"."mvw_BlfrgPositionen"."POSITION_ID_DISPO" = "StadtlaufBS"."mvw_BasisAusruestung"."POSITION_ID";

-- Liefer-Position Liefer-Positionen
CREATE
MATERIALIZED VIEW "StadtlaufBS"."mvw_BlfrgLieferPos" AS
SELECT
"StadtlaufBS"."mvw_BasisDokument"."DOKUMENT_ID",
"StadtlaufBS"."mvw_BasisDokument"."POSITION_TYP_ID",
"StadtlaufBS"."mvw_BasisDokument"."SEKTOR_TYP_ID",
"StadtlaufBS"."mvw_BasisDokument"."LIEFERART_ID",
"StadtlaufBS"."mvw_BasisDokument"."DOKUMENT_TI",
"StadtlaufBS"."mvw_BasisDokument"."DOKUMENT_PGM",
"StadtlaufBS"."mvw_BasisDokument"."DOKUMENT_ERGAENZUNG_URL",
"StadtlaufBS"."mvw_BasisDokument"."SEKTOR_TYP_BZ",
"StadtlaufBS"."mvw_BasisDokument"."POSITION_TYP_BZ",
"StadtlaufBS"."mvw_BasisDokument"."LIEFERART_BZ",
"StadtlaufBS"."mvw_BasisDokument"."LIEFERART_DSC",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."SEKTOR_AKTIV_ID",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."SEKTOR_SRT",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."SEKTOR_CHEF_NM",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."BESAMMLUNG_ZT",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."BESAMMLUNG_ORT_ID",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."POSITION_LIEFERUNG_ID",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."PLAN_DISPOSITIV_URL",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."PLAN_POSITIONEN_URL",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."PLAN_BESAMMLUNG_URL",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."PLAN_LIEFERORTE_URL",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."SEKTOR_BZ",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."SEKTOR_NM",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."SEKTOR_ID",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."AUSTRAGUNG_ID",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."AUSTRAGUNG_DT",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."AUSTRAGUNG_ZUS_DSC",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."PLAN_VERKEHRSREGIME_URL",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."ANLASS_ID",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."ANLASS_NM",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."ANLASS_DSC",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."ANLASS_LOGO_URL",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."POLIZEI_ABTEILUNG_NM",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."POLIZEI_LOGO_URL",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."DISPO_DOKU_TI",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."LFRG_SEKTOR_MAT_JN",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."SEKTOR_AKTIV_ID_DISPO",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."SEKTOR_SRT_DISPO",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."SEKTOR_CHEF_NM_DISPO",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."BESAMMLUNG_ZT_DISPO",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."BESAMMLUNG_ORT_ID_DISPO",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."POSITION_LIEFERUNG_ID_DISPO",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."PLAN_DISPOSITIV_URL_DISPO",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."PLAN_POSITIONEN_URL_DISPO",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."PLAN_BESAMMLUNG_URL_DISPO",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."PLAN_LIEFERORTE_URL_DISPO",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."SEKTOR_BZ_DISPO",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."SEKTOR_NM_DISPO",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."SEKTOR_ID_DISPO",
"StadtlaufBS"."mvw_BlfrgPositionen"."POSITION_TX",
"StadtlaufBS"."mvw_BlfrgPositionen"."POSITION_BZ",
"StadtlaufBS"."mvw_BlfrgPositionen"."POSITION_ID",
"StadtlaufBS"."mvw_BlfrgPositionen"."POSITION_DSC",
"StadtlaufBS"."mvw_BlfrgPositionen"."ORTSCHAFT_TX",
"StadtlaufBS"."mvw_BlfrgPositionen"."OERTLICHKEIT_TX",
"StadtlaufBS"."mvw_BlfrgPositionen"."ABSCHNITT_TX",
"StadtlaufBS"."mvw_BlfrgPositionen"."BEREIT_ZT",
"StadtlaufBS"."mvw_BlfrgPositionen"."SPERRE_AB_ZT",
"StadtlaufBS"."mvw_BlfrgPositionen"."SPERRE_BIS_ZT",
"StadtlaufBS"."mvw_BlfrgPositionen"."AUFTRAG_ANW",
"StadtlaufBS"."mvw_BlfrgPositionen"."MASSNAHME_ANW",
"StadtlaufBS"."mvw_BlfrgPositionen"."AUFBAU_ANW",
"StadtlaufBS"."mvw_BlfrgPositionen"."SITUATION_BILD_URL",
"StadtlaufBS"."mvw_BlfrgPositionen"."POSITION_NR_DISPO",
"StadtlaufBS"."mvw_BlfrgPositionen"."POSITION_BZ_DISPO",
"StadtlaufBS"."mvw_BlfrgPositionen"."POSITION_ID_DISPO",
0                                                             AS "VORSIGNAL_ID",
"StadtlaufBS"."mvw_BlfrgPositionen"."POSITION_DSC_DISPO",
"StadtlaufBS"."mvw_BlfrgPositionen"."ORTSCHAFT_TX_DISPO",
"StadtlaufBS"."mvw_BlfrgPositionen"."OERTLICHKEIT_TX_DISPO",
"StadtlaufBS"."mvw_BlfrgPositionen"."ABSCHNITT_TX_DISPO",
"StadtlaufBS"."mvw_BlfrgPositionen"."LIEFER_POS_ID_DISPO",
"StadtlaufBS"."mvw_BlfrgPositionen"."POSITION_TYP_ID_DISPO",
"StadtlaufBS"."mvw_BlfrgPositionen"."POSITION_TYP_BZ_DISPO",
"StadtlaufBS"."mvw_BasisAusruestung"."MATERIAL_ID",
"StadtlaufBS"."mvw_BasisAusruestung"."MATERIAL_BZ",
"StadtlaufBS"."mvw_BasisAusruestung"."MATERIAL_NM",
"StadtlaufBS"."mvw_BasisAusruestung"."MATERIAL_ICON_URL",
"StadtlaufBS"."mvw_BasisAusruestung"."AUSRUESTUNG_AZ"
FROM
"StadtlaufBS"."mvw_BasisDokument"
JOIN "StadtlaufBS"."mvw_BlfrgAnlassSektoren"    ON "StadtlaufBS"."mvw_BasisDokument"."SEKTOR_TYP_ID" = "StadtlaufBS"."mvw_BlfrgAnlassSektoren"."SEKTOR_TYP_ID"
JOIN "StadtlaufBS"."mvw_BlfrgPositionen"        ON "StadtlaufBS"."mvw_BasisDokument"."POSITION_TYP_ID" = "StadtlaufBS"."mvw_BlfrgPositionen"."POSITION_TYP_ID"
                                         AND "StadtlaufBS"."mvw_BlfrgAnlassSektoren"."SEKTOR_AKTIV_ID_DISPO" = "StadtlaufBS"."mvw_BlfrgPositionen"."SEKTOR_AKTIV_ID"
JOIN "StadtlaufBS"."mvw_BasisAusruestung"       ON "StadtlaufBS"."mvw_BasisDokument"."LIEFERART_ID" = "StadtlaufBS"."mvw_BasisAusruestung"."LIEFERART_ID"
                                         AND "StadtlaufBS"."mvw_BlfrgPositionen"."POSITION_ID" = "StadtlaufBS"."mvw_BasisAusruestung"."POSITION_ID";

-- Liefer-Position direkt an Dispo-Positionen
CREATE
MATERIALIZED VIEW "StadtlaufBS"."mvw_BlfrgSignalisation" AS
SELECT
"StadtlaufBS"."mvw_BasisDokument"."DOKUMENT_ID",
"StadtlaufBS"."mvw_BasisDokument"."POSITION_TYP_ID",
"StadtlaufBS"."mvw_BasisDokument"."SEKTOR_TYP_ID",
"StadtlaufBS"."mvw_BasisDokument"."LIEFERART_ID",
"StadtlaufBS"."mvw_BasisDokument"."DOKUMENT_TI",
"StadtlaufBS"."mvw_BasisDokument"."DOKUMENT_PGM",
"StadtlaufBS"."mvw_BasisDokument"."DOKUMENT_ERGAENZUNG_URL",
"StadtlaufBS"."mvw_BasisDokument"."SEKTOR_TYP_BZ",
"StadtlaufBS"."mvw_BasisDokument"."POSITION_TYP_BZ",
"StadtlaufBS"."mvw_BasisDokument"."LIEFERART_BZ",
"StadtlaufBS"."mvw_BasisDokument"."LIEFERART_DSC",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."SEKTOR_AKTIV_ID",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."SEKTOR_SRT",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."SEKTOR_CHEF_NM",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."BESAMMLUNG_ZT",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."BESAMMLUNG_ORT_ID",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."POSITION_LIEFERUNG_ID",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."PLAN_DISPOSITIV_URL",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."PLAN_POSITIONEN_URL",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."PLAN_BESAMMLUNG_URL",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."PLAN_LIEFERORTE_URL",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."SEKTOR_BZ",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."SEKTOR_NM",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."SEKTOR_ID",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."AUSTRAGUNG_ID",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."AUSTRAGUNG_DT",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."AUSTRAGUNG_ZUS_DSC",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."PLAN_VERKEHRSREGIME_URL",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."ANLASS_ID",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."ANLASS_NM",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."ANLASS_DSC",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."ANLASS_LOGO_URL",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."POLIZEI_ABTEILUNG_NM",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."POLIZEI_LOGO_URL",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."DISPO_DOKU_TI",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."LFRG_SEKTOR_MAT_JN",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."SEKTOR_AKTIV_ID_DISPO",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."SEKTOR_SRT_DISPO",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."SEKTOR_CHEF_NM_DISPO",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."BESAMMLUNG_ZT_DISPO",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."BESAMMLUNG_ORT_ID_DISPO",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."POSITION_LIEFERUNG_ID_DISPO",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."PLAN_DISPOSITIV_URL_DISPO",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."PLAN_POSITIONEN_URL_DISPO",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."PLAN_BESAMMLUNG_URL_DISPO",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."PLAN_LIEFERORTE_URL_DISPO",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."SEKTOR_BZ_DISPO",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."SEKTOR_NM_DISPO",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."SEKTOR_ID_DISPO",
TO_CHAR("StadtlaufBS"."mvw_BlfrgPositionen"."POSITION_NR", '99')    AS "POSITION_TX",
''                                                          AS "POSITION_BZ",
"StadtlaufBS"."mvw_BlfrgPositionen"."POSITION_ID",
''                                                          AS "POSITION_DSC",
''                                                          AS "ORTSCHAFT_TX",
"StadtlaufBS"."mvw_BlfrgPositionen"."OERTLICHKEIT_TX",
''                                                          AS "ABSCHNITT_TX",
MAKE_TIME(0, 0, 0.0)                                        AS "BEREIT_ZT",
MAKE_TIME(0, 0, 0.0)                                        AS "SPERRE_AB_ZT",
MAKE_TIME(0, 0, 0.0)                                        AS "SPERRE_BIS_ZT",
''                                                          AS "AUFTRAG_ANW",
''                                                          AS "MASSNAHME_ANW",
''                                                          AS "AUFBAU_ANW",
''                                                          AS "SITUATION_BILD_URL",
"StadtlaufBS"."mvw_BlfrgPositionen"."POSITION_NR"                 AS "POSITION_NR_DISPO",
"StadtlaufBS"."mvw_BlfrgPositionen"."POSITION_BZ"                 AS "POSITION_BZ_DISPO",
"StadtlaufBS"."mvw_BlfrgPositionen"."POSITION_ID"                 AS "POSITION_ID_DISPO",
0                                                           AS "VORSIGNAL_ID",
"StadtlaufBS"."mvw_BlfrgPositionen"."POSITION_DSC"                AS "POSITION_DSC_DISPO",
"StadtlaufBS"."mvw_BlfrgPositionen"."ORTSCHAFT_TX"                AS "ORTSCHAFT_TX_DISPO",
"StadtlaufBS"."mvw_BlfrgPositionen"."OERTLICHKEIT_TX"             AS "OERTLICHKEIT_TX_DISPO",
"StadtlaufBS"."mvw_BlfrgPositionen"."ABSCHNITT_TX"                AS "ABSCHNITT_TX_DISPO",
"StadtlaufBS"."mvw_BlfrgPositionen"."LIEFER_POS_ID"               AS "LIEFER_POS_ID_DISPO",
"StadtlaufBS"."mvw_BlfrgPositionen"."POSITION_TYP_ID"             AS "POSITION_TYP_ID_DISPO",
"StadtlaufBS"."mvw_BlfrgPositionen"."POSITION_TYP_BZ"             AS "POSITION_TYP_BZ_DISPO",
"StadtlaufBS"."mvw_BasisAusruestung"."MATERIAL_ID",
"StadtlaufBS"."mvw_BasisAusruestung"."MATERIAL_BZ",
"StadtlaufBS"."mvw_BasisAusruestung"."MATERIAL_NM",
"StadtlaufBS"."mvw_BasisAusruestung"."MATERIAL_ICON_URL",
"StadtlaufBS"."mvw_BasisAusruestung"."AUSRUESTUNG_AZ"
FROM
"StadtlaufBS"."mvw_BasisDokument"
JOIN "StadtlaufBS"."mvw_BlfrgAnlassSektoren"    ON "StadtlaufBS"."mvw_BasisDokument"."SEKTOR_TYP_ID" = "StadtlaufBS"."mvw_BlfrgAnlassSektoren"."SEKTOR_TYP_ID_DISPO"
JOIN "StadtlaufBS"."mvw_BlfrgPositionen"        ON "StadtlaufBS"."mvw_BasisDokument"."POSITION_TYP_ID" = "StadtlaufBS"."mvw_BlfrgPositionen"."POSITION_TYP_ID"
                                         AND "StadtlaufBS"."mvw_BlfrgAnlassSektoren"."SEKTOR_AKTIV_ID_DISPO" = "StadtlaufBS"."mvw_BlfrgPositionen"."SEKTOR_AKTIV_ID"
JOIN "StadtlaufBS"."mvw_BasisAusruestung"       ON "StadtlaufBS"."mvw_BasisDokument"."LIEFERART_ID" = "StadtlaufBS"."mvw_BasisAusruestung"."LIEFERART_ID"
                                         AND "StadtlaufBS"."mvw_BlfrgPositionen"."POSITION_ID" = "StadtlaufBS"."mvw_BasisAusruestung"."POSITION_ID";

-- Liefer-Position Vorsignal-Positionen
CREATE
MATERIALIZED VIEW "StadtlaufBS"."mvw_BlfrgVorsignal" AS
SELECT
"StadtlaufBS"."mvw_BasisDokument"."DOKUMENT_ID",
"StadtlaufBS"."mvw_BasisDokument"."POSITION_TYP_ID",
"StadtlaufBS"."mvw_BasisDokument"."SEKTOR_TYP_ID",
"StadtlaufBS"."mvw_BasisDokument"."LIEFERART_ID",
"StadtlaufBS"."mvw_BasisDokument"."DOKUMENT_TI",
"StadtlaufBS"."mvw_BasisDokument"."DOKUMENT_PGM",
"StadtlaufBS"."mvw_BasisDokument"."DOKUMENT_ERGAENZUNG_URL",
"StadtlaufBS"."mvw_BasisDokument"."SEKTOR_TYP_BZ",
"StadtlaufBS"."mvw_BasisDokument"."POSITION_TYP_BZ",
"StadtlaufBS"."mvw_BasisDokument"."LIEFERART_BZ",
"StadtlaufBS"."mvw_BasisDokument"."LIEFERART_DSC",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."SEKTOR_AKTIV_ID",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."SEKTOR_SRT",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."SEKTOR_CHEF_NM",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."BESAMMLUNG_ZT",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."BESAMMLUNG_ORT_ID",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."POSITION_LIEFERUNG_ID",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."PLAN_DISPOSITIV_URL",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."PLAN_POSITIONEN_URL",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."PLAN_BESAMMLUNG_URL",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."PLAN_LIEFERORTE_URL",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."SEKTOR_BZ",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."SEKTOR_NM",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."SEKTOR_ID",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."AUSTRAGUNG_ID",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."AUSTRAGUNG_DT",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."AUSTRAGUNG_ZUS_DSC",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."PLAN_VERKEHRSREGIME_URL",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."ANLASS_ID",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."ANLASS_NM",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."ANLASS_DSC",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."ANLASS_LOGO_URL",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."POLIZEI_ABTEILUNG_NM",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."POLIZEI_LOGO_URL",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."DISPO_DOKU_TI",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."LFRG_SEKTOR_MAT_JN",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."SEKTOR_AKTIV_ID_DISPO",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."SEKTOR_SRT_DISPO",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."SEKTOR_CHEF_NM_DISPO",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."BESAMMLUNG_ZT_DISPO",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."BESAMMLUNG_ORT_ID_DISPO",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."POSITION_LIEFERUNG_ID_DISPO",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."PLAN_DISPOSITIV_URL_DISPO",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."PLAN_POSITIONEN_URL_DISPO",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."PLAN_BESAMMLUNG_URL_DISPO",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."PLAN_LIEFERORTE_URL_DISPO",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."SEKTOR_BZ_DISPO",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."SEKTOR_NM_DISPO",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."SEKTOR_ID_DISPO",
TO_CHAR("StadtlaufBS"."mvw_BlfrgPositionen"."POSITION_NR", '99')    AS "POSITION_TX",
''                                                          AS "POSITION_BZ",
"StadtlaufBS"."mvw_BlfrgPositionen"."POSITION_ID",
''                                                          AS "POSITION_DSC",
''                                                          AS "ORTSCHAFT_TX",
"StadtlaufBS"."mvw_BasisVorsignal"."VORSIGNAL_ORT_TX"             AS "OERTLICHKEIT_TX",
''                                                          AS "ABSCHNITT_TX",
MAKE_TIME(0, 0, 0.0)                                        AS "BEREIT_ZT",
MAKE_TIME(0, 0, 0.0)                                        AS "SPERRE_AB_ZT",
MAKE_TIME(0, 0, 0.0)                                        AS "SPERRE_BIS_ZT",
''                                                          AS "AUFTRAG_ANW",
''                                                          AS "MASSNAHME_ANW",
''                                                          AS "AUFBAU_ANW",
''                                                          AS "SITUATION_BILD_URL",
"StadtlaufBS"."mvw_BlfrgPositionen"."POSITION_NR"                 AS "POSITION_NR_DISPO",
"StadtlaufBS"."mvw_BlfrgPositionen"."POSITION_BZ"                 AS "POSITION_BZ_DISPO",
"StadtlaufBS"."mvw_BlfrgPositionen"."POSITION_ID"                 AS "POSITION_ID_DISPO",
"StadtlaufBS"."mvw_BasisVorsignal"."VORSIGNAL_ID",
"StadtlaufBS"."mvw_BlfrgPositionen"."POSITION_DSC"                AS "POSITION_DSC_DISPO",
"StadtlaufBS"."mvw_BlfrgPositionen"."ORTSCHAFT_TX"                AS "ORTSCHAFT_TX_DISPO",
"StadtlaufBS"."mvw_BasisVorsignal"."VORSIGNAL_ORT_TX"             AS "OERTLICHKEIT_TX_DISPO",
"StadtlaufBS"."mvw_BlfrgPositionen"."ABSCHNITT_TX"                AS "ABSCHNITT_TX_DISPO",
"StadtlaufBS"."mvw_BlfrgPositionen"."LIEFER_POS_ID"               AS "LIEFER_POS_ID_DISPO",
"StadtlaufBS"."mvw_BlfrgPositionen"."POSITION_TYP_ID"             AS "POSITION_TYP_ID_DISPO",
"StadtlaufBS"."mvw_BlfrgPositionen"."POSITION_TYP_BZ"             AS "POSITION_TYP_BZ_DISPO",
"StadtlaufBS"."mvw_BasisVorsignal"."MATERIAL_ID",
"StadtlaufBS"."mvw_BasisVorsignal"."MATERIAL_BZ",
"StadtlaufBS"."mvw_BasisVorsignal"."MATERIAL_NM",
"StadtlaufBS"."mvw_BasisVorsignal"."MATERIAL_ICON_URL",
1                    AS "AUSRUESTUNG_AZ"
FROM
"StadtlaufBS"."mvw_BasisDokument"
JOIN "StadtlaufBS"."mvw_BlfrgAnlassSektoren"    ON "StadtlaufBS"."mvw_BasisDokument"."SEKTOR_TYP_ID" = "StadtlaufBS"."mvw_BlfrgAnlassSektoren"."SEKTOR_TYP_ID_DISPO"
JOIN "StadtlaufBS"."mvw_BlfrgPositionen"        ON "StadtlaufBS"."mvw_BasisDokument"."POSITION_TYP_ID" = "StadtlaufBS"."mvw_BlfrgPositionen"."POSITION_TYP_ID"
                                         AND "StadtlaufBS"."mvw_BlfrgAnlassSektoren"."SEKTOR_AKTIV_ID_DISPO" = "StadtlaufBS"."mvw_BlfrgPositionen"."SEKTOR_AKTIV_ID"
JOIN "StadtlaufBS"."mvw_BasisVorsignal"         ON "StadtlaufBS"."mvw_BasisDokument"."LIEFERART_ID" = "StadtlaufBS"."mvw_BasisVorsignal"."LIEFERART_ID"
                                         AND "StadtlaufBS"."mvw_BlfrgPositionen"."POSITION_ID" = "StadtlaufBS"."mvw_BasisVorsignal"."POSITION_ID";

-- Liefer-Position Sektor-Liefer-Positionen
CREATE
MATERIALIZED VIEW "StadtlaufBS"."mvw_BlfrgSektLieferPos" AS
SELECT
"StadtlaufBS"."mvw_BasisDokument"."DOKUMENT_ID",
"StadtlaufBS"."mvw_BasisDokument"."POSITION_TYP_ID",
"StadtlaufBS"."mvw_BasisDokument"."SEKTOR_TYP_ID",
"StadtlaufBS"."mvw_BasisDokument"."LIEFERART_ID",
"StadtlaufBS"."mvw_BasisDokument"."DOKUMENT_TI",
"StadtlaufBS"."mvw_BasisDokument"."DOKUMENT_PGM",
"StadtlaufBS"."mvw_BasisDokument"."DOKUMENT_ERGAENZUNG_URL",
"StadtlaufBS"."mvw_BasisDokument"."SEKTOR_TYP_BZ",
"StadtlaufBS"."mvw_BasisDokument"."POSITION_TYP_BZ",
"StadtlaufBS"."mvw_BasisDokument"."LIEFERART_BZ",
"StadtlaufBS"."mvw_BasisDokument"."LIEFERART_DSC",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."SEKTOR_AKTIV_ID",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."SEKTOR_SRT",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."SEKTOR_CHEF_NM",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."BESAMMLUNG_ZT",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."BESAMMLUNG_ORT_ID",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."POSITION_LIEFERUNG_ID",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."PLAN_DISPOSITIV_URL",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."PLAN_POSITIONEN_URL",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."PLAN_BESAMMLUNG_URL",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."PLAN_LIEFERORTE_URL",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."SEKTOR_BZ",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."SEKTOR_NM",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."SEKTOR_ID",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."AUSTRAGUNG_ID",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."AUSTRAGUNG_DT",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."AUSTRAGUNG_ZUS_DSC",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."PLAN_VERKEHRSREGIME_URL",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."ANLASS_ID",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."ANLASS_NM",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."ANLASS_DSC",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."ANLASS_LOGO_URL",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."POLIZEI_ABTEILUNG_NM",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."POLIZEI_LOGO_URL",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."DISPO_DOKU_TI",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."LFRG_SEKTOR_MAT_JN",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."SEKTOR_AKTIV_ID_DISPO",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."SEKTOR_SRT_DISPO",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."SEKTOR_CHEF_NM_DISPO",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."BESAMMLUNG_ZT_DISPO",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."BESAMMLUNG_ORT_ID_DISPO",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."POSITION_LIEFERUNG_ID_DISPO",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."PLAN_DISPOSITIV_URL_DISPO",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."PLAN_POSITIONEN_URL_DISPO",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."PLAN_BESAMMLUNG_URL_DISPO",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."PLAN_LIEFERORTE_URL_DISPO",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."SEKTOR_BZ_DISPO",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."SEKTOR_NM_DISPO",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."SEKTOR_ID_DISPO",
"StadtlaufBS"."mvw_BlfrgPositionen"."POSITION_TX",
"StadtlaufBS"."mvw_BlfrgPositionen"."POSITION_BZ",
"StadtlaufBS"."mvw_BlfrgPositionen"."POSITION_ID",
"StadtlaufBS"."mvw_BlfrgPositionen"."POSITION_DSC",
"StadtlaufBS"."mvw_BlfrgPositionen"."ORTSCHAFT_TX",
"StadtlaufBS"."mvw_BlfrgPositionen"."OERTLICHKEIT_TX",
"StadtlaufBS"."mvw_BlfrgPositionen"."ABSCHNITT_TX",
"StadtlaufBS"."mvw_BlfrgPositionen"."BEREIT_ZT",
"StadtlaufBS"."mvw_BlfrgPositionen"."SPERRE_AB_ZT",
"StadtlaufBS"."mvw_BlfrgPositionen"."SPERRE_BIS_ZT",
"StadtlaufBS"."mvw_BlfrgPositionen"."AUFTRAG_ANW",
"StadtlaufBS"."mvw_BlfrgPositionen"."MASSNAHME_ANW",
"StadtlaufBS"."mvw_BlfrgPositionen"."AUFBAU_ANW",
"StadtlaufBS"."mvw_BlfrgPositionen"."SITUATION_BILD_URL",
"StadtlaufBS"."mvw_BlfrgPositionen"."POSITION_NR_DISPO",
"StadtlaufBS"."mvw_BlfrgPositionen"."POSITION_BZ_DISPO",
"StadtlaufBS"."mvw_BlfrgPositionen"."POSITION_ID_DISPO",
0                                                           AS "VORSIGNAL_ID",
"StadtlaufBS"."mvw_BlfrgPositionen"."POSITION_DSC_DISPO",
"StadtlaufBS"."mvw_BlfrgPositionen"."ORTSCHAFT_TX_DISPO",
"StadtlaufBS"."mvw_BlfrgPositionen"."OERTLICHKEIT_TX_DISPO",
"StadtlaufBS"."mvw_BlfrgPositionen"."ABSCHNITT_TX_DISPO",
"StadtlaufBS"."mvw_BlfrgPositionen"."LIEFER_POS_ID_DISPO",
"StadtlaufBS"."mvw_BlfrgPositionen"."POSITION_TYP_ID_DISPO",
"StadtlaufBS"."mvw_BlfrgPositionen"."POSITION_TYP_BZ_DISPO",
"StadtlaufBS"."mvw_BasisAusruestung"."MATERIAL_ID",
"StadtlaufBS"."mvw_BasisAusruestung"."MATERIAL_BZ",
"StadtlaufBS"."mvw_BasisAusruestung"."MATERIAL_NM",
"StadtlaufBS"."mvw_BasisAusruestung"."MATERIAL_ICON_URL",
"StadtlaufBS"."mvw_BasisAusruestung"."AUSRUESTUNG_AZ"
FROM
"StadtlaufBS"."mvw_BasisDokument"
JOIN "StadtlaufBS"."mvw_BlfrgAnlassSektoren"    ON "StadtlaufBS"."mvw_BasisDokument"."SEKTOR_TYP_ID" = "StadtlaufBS"."mvw_BlfrgAnlassSektoren"."SEKTOR_TYP_ID"
JOIN "StadtlaufBS"."mvw_BlfrgPositionen"        ON "StadtlaufBS"."mvw_BasisDokument"."POSITION_TYP_ID" = "StadtlaufBS"."mvw_BlfrgPositionen"."POSITION_TYP_ID"
                                         AND "StadtlaufBS"."mvw_BlfrgAnlassSektoren"."POSITION_LIEFERUNG_ID_DISPO" = "StadtlaufBS"."mvw_BlfrgPositionen"."POSITION_ID"
JOIN "StadtlaufBS"."mvw_BasisAusruestung"       ON "StadtlaufBS"."mvw_BasisDokument"."LIEFERART_ID" = "StadtlaufBS"."mvw_BasisAusruestung"."LIEFERART_ID"
                                         AND "StadtlaufBS"."mvw_BlfrgPositionen"."POSITION_ID" = "StadtlaufBS"."mvw_BasisAusruestung"."POSITION_ID";

-- Liefer-Position Besammlung-Positionen
CREATE
MATERIALIZED VIEW "StadtlaufBS"."mvw_BlfrgSektBesammlungPos" AS
SELECT
"StadtlaufBS"."mvw_BasisDokument"."DOKUMENT_ID",
"StadtlaufBS"."mvw_BasisDokument"."POSITION_TYP_ID",
"StadtlaufBS"."mvw_BasisDokument"."SEKTOR_TYP_ID",
"StadtlaufBS"."mvw_BasisDokument"."LIEFERART_ID",
"StadtlaufBS"."mvw_BasisDokument"."DOKUMENT_TI",
"StadtlaufBS"."mvw_BasisDokument"."DOKUMENT_PGM",
"StadtlaufBS"."mvw_BasisDokument"."DOKUMENT_ERGAENZUNG_URL",
"StadtlaufBS"."mvw_BasisDokument"."SEKTOR_TYP_BZ",
"StadtlaufBS"."mvw_BasisDokument"."POSITION_TYP_BZ",
"StadtlaufBS"."mvw_BasisDokument"."LIEFERART_BZ",
"StadtlaufBS"."mvw_BasisDokument"."LIEFERART_DSC",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."SEKTOR_AKTIV_ID",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."SEKTOR_SRT",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."SEKTOR_CHEF_NM",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."BESAMMLUNG_ZT",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."BESAMMLUNG_ORT_ID",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."POSITION_LIEFERUNG_ID",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."PLAN_DISPOSITIV_URL",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."PLAN_POSITIONEN_URL",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."PLAN_BESAMMLUNG_URL",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."PLAN_LIEFERORTE_URL",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."SEKTOR_BZ",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."SEKTOR_NM",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."SEKTOR_ID",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."AUSTRAGUNG_ID",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."AUSTRAGUNG_DT",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."AUSTRAGUNG_ZUS_DSC",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."PLAN_VERKEHRSREGIME_URL",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."ANLASS_ID",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."ANLASS_NM",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."ANLASS_DSC",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."ANLASS_LOGO_URL",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."POLIZEI_ABTEILUNG_NM",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."POLIZEI_LOGO_URL",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."DISPO_DOKU_TI",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."LFRG_SEKTOR_MAT_JN",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."SEKTOR_AKTIV_ID_DISPO",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."SEKTOR_SRT_DISPO",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."SEKTOR_CHEF_NM_DISPO",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."BESAMMLUNG_ZT_DISPO",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."BESAMMLUNG_ORT_ID_DISPO",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."POSITION_LIEFERUNG_ID_DISPO",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."PLAN_DISPOSITIV_URL_DISPO",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."PLAN_POSITIONEN_URL_DISPO",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."PLAN_BESAMMLUNG_URL_DISPO",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."PLAN_LIEFERORTE_URL_DISPO",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."SEKTOR_BZ_DISPO",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."SEKTOR_NM_DISPO",
"StadtlaufBS"."mvw_BlfrgAnlassSektoren"."SEKTOR_ID_DISPO",
"StadtlaufBS"."mvw_BlfrgPositionen"."POSITION_TX",
"StadtlaufBS"."mvw_BlfrgPositionen"."POSITION_BZ",
"StadtlaufBS"."mvw_BlfrgPositionen"."POSITION_ID",
"StadtlaufBS"."mvw_BlfrgPositionen"."POSITION_DSC",
"StadtlaufBS"."mvw_BlfrgPositionen"."ORTSCHAFT_TX",
"StadtlaufBS"."mvw_BlfrgPositionen"."OERTLICHKEIT_TX",
"StadtlaufBS"."mvw_BlfrgPositionen"."ABSCHNITT_TX",
"StadtlaufBS"."mvw_BlfrgPositionen"."BEREIT_ZT",
"StadtlaufBS"."mvw_BlfrgPositionen"."SPERRE_AB_ZT",
"StadtlaufBS"."mvw_BlfrgPositionen"."SPERRE_BIS_ZT",
"StadtlaufBS"."mvw_BlfrgPositionen"."AUFTRAG_ANW",
"StadtlaufBS"."mvw_BlfrgPositionen"."MASSNAHME_ANW",
"StadtlaufBS"."mvw_BlfrgPositionen"."AUFBAU_ANW",
"StadtlaufBS"."mvw_BlfrgPositionen"."SITUATION_BILD_URL",
"StadtlaufBS"."mvw_BlfrgPositionen"."POSITION_NR_DISPO",
"StadtlaufBS"."mvw_BlfrgPositionen"."POSITION_BZ_DISPO",
"StadtlaufBS"."mvw_BlfrgPositionen"."POSITION_ID_DISPO",
0                                                           AS "VORSIGNAL_ID",
"StadtlaufBS"."mvw_BlfrgPositionen"."POSITION_DSC_DISPO",
"StadtlaufBS"."mvw_BlfrgPositionen"."ORTSCHAFT_TX_DISPO",
"StadtlaufBS"."mvw_BlfrgPositionen"."OERTLICHKEIT_TX_DISPO",
"StadtlaufBS"."mvw_BlfrgPositionen"."ABSCHNITT_TX_DISPO",
"StadtlaufBS"."mvw_BlfrgPositionen"."LIEFER_POS_ID_DISPO",
"StadtlaufBS"."mvw_BlfrgPositionen"."POSITION_TYP_ID_DISPO",
"StadtlaufBS"."mvw_BlfrgPositionen"."POSITION_TYP_BZ_DISPO",
"StadtlaufBS"."mvw_BasisAusruestung"."MATERIAL_ID",
"StadtlaufBS"."mvw_BasisAusruestung"."MATERIAL_BZ",
"StadtlaufBS"."mvw_BasisAusruestung"."MATERIAL_NM",
"StadtlaufBS"."mvw_BasisAusruestung"."MATERIAL_ICON_URL",
"StadtlaufBS"."mvw_BasisAusruestung"."AUSRUESTUNG_AZ"
FROM
"StadtlaufBS"."mvw_BasisDokument"
JOIN "StadtlaufBS"."mvw_BlfrgAnlassSektoren"    ON "StadtlaufBS"."mvw_BasisDokument"."SEKTOR_TYP_ID" = "StadtlaufBS"."mvw_BlfrgAnlassSektoren"."SEKTOR_TYP_ID"
JOIN "StadtlaufBS"."mvw_BlfrgPositionen"        ON "StadtlaufBS"."mvw_BasisDokument"."POSITION_TYP_ID" = "StadtlaufBS"."mvw_BlfrgPositionen"."POSITION_TYP_ID"
                                         AND "StadtlaufBS"."mvw_BlfrgAnlassSektoren"."BESAMMLUNG_ORT_ID_DISPO" = "StadtlaufBS"."mvw_BlfrgPositionen"."POSITION_ID"
JOIN "StadtlaufBS"."mvw_BasisAusruestung"       ON "StadtlaufBS"."mvw_BasisDokument"."LIEFERART_ID" = "StadtlaufBS"."mvw_BasisAusruestung"."LIEFERART_ID"
                                         AND "StadtlaufBS"."mvw_BlfrgPositionen"."POSITION_ID" = "StadtlaufBS"."mvw_BasisAusruestung"."POSITION_ID";

-- Liefer-Position gesammelt
CREATE
MATERIALIZED VIEW "StadtlaufBS"."mvw_BlfrgMaterialAllePos" AS
SELECT
--    DISTINCT ON ("DISPO_POS_ID", "LFRG_POS_ID", "VORSIGNAL_ID", "MATERIAL_ID", "DOKUMENT_ID_LFRG")
 *
FROM
   (
    SELECT *
    FROM "StadtlaufBS"."mvw_BlfrgDispoPos"
    UNION
    SELECT *
    FROM "StadtlaufBS"."mvw_BlfrgLieferPos"
    UNION
    SELECT *
    FROM "StadtlaufBS"."mvw_BlfrgSignalisation"
    UNION
    SELECT *
    FROM "StadtlaufBS"."mvw_BlfrgVorsignal"
    --UNION
    --SELECT *
    --FROM  "StadtlaufBS"."mvw_BlfrgSektLieferPos"
    --UNION
    --SELECT *
    --FROM  "StadtlaufBS"."mvw_BlfrgSektBesammlungPos"
    )
   AS AllePosBlfr
;

-- Materialbedarf-Liste
CREATE
MATERIALIZED VIEW "StadtlaufBS"."mvw_ReportBlfrgMaterialBedarf" AS
SELECT
     "xvw_ReportBlfrgMaterialBedarf"."LEVEL_SRT"                   AS "LEVEL_SRT",
     MAX("xvw_ReportBlfrgMaterialBedarf"."LEVEL")                  AS "MAX_LEVEL",
     MAX("xvw_ReportBlfrgMaterialBedarf"."LEVEL_LBL")              AS "MAX_LEVEL_LBL",
     "xvw_ReportBlfrgMaterialBedarf"."LEVEL_RNK"                   AS "LEVEL_RNK",
     "xvw_ReportBlfrgMaterialBedarf"."ANLASS_ID"                   AS "ANLASS_ID",
     MAX("xvw_ReportBlfrgMaterialBedarf"."ANLASS_NM")              AS "MAX_ANLASS_NM",
     MAX("xvw_ReportBlfrgMaterialBedarf"."ANLASS_LOGO_URL")        AS "MAX_ANLASS_LOGO_URL",
     "xvw_ReportBlfrgMaterialBedarf"."AUSTRAGUNG_ID"               AS "AUSTRAGUNG_ID",
     MAX("xvw_ReportBlfrgMaterialBedarf"."AUSTRAGUNG_DT")          AS "MAX_AUSTRAGUNG_DT",
     "xvw_ReportBlfrgMaterialBedarf"."SEKTOR_AKTIV_ID"             AS "SEKTOR_AKTIV_ID",
     MAX("xvw_ReportBlfrgMaterialBedarf"."SEKTOR_SRT")             AS "MAX_SEKTOR_SRT",
     MAX("xvw_ReportBlfrgMaterialBedarf"."SEKTOR_NM")              AS "MAX_SEKTOR_NM",
     MAX("xvw_ReportBlfrgMaterialBedarf"."SEKTOR_BZ")              AS "MAX_SEKTOR_BZ",
     MAX("xvw_ReportBlfrgMaterialBedarf"."SEKTOR_LBL")             AS "MAX_SEKTOR_LBL",
     MAX("xvw_ReportBlfrgMaterialBedarf"."POSITION_TX")            AS "MAX_POSITION_TX",
     "xvw_ReportBlfrgMaterialBedarf"."POSITION_ID"                 AS "POSITION_ID",
     MAX("xvw_ReportBlfrgMaterialBedarf"."OERTLICHKEIT_TX")        AS "MAX_OERTLICHKEIT_TX_BLFRG",
     MAX("xvw_ReportBlfrgMaterialBedarf"."POSITION_NR_DISPO")      AS "POSITION_NR_DISPO",
     "xvw_ReportBlfrgMaterialBedarf"."VORSIGNAL_ID"                AS "VORSIGNAL_ID",
     "xvw_ReportBlfrgMaterialBedarf"."POSITION_ID_DISPO"           AS "POSITION_ID_DISPO",
     MAX("xvw_ReportBlfrgMaterialBedarf"."OERTLICHKEIT_TX_DISPO")  AS "MAX_OERTLICHKEIT_TX_DISPO",
     CASE
      WHEN "LEVEL_SRT" = '3' AND "LEVEL_RNK" = '2' AND MAX("POSITION_NR_DISPO") > 0
                                                    THEN  TO_CHAR(MAX("xvw_ReportBlfrgMaterialBedarf"."POSITION_NR_DISPO"), '99')
      ELSE                                                ''
     END                                                           AS "MAX_POSITION_NR_DISPO",
     CASE
      WHEN "LEVEL_SRT" = '3' AND "LEVEL_RNK" = '2'  AND MAX("POSITION_NR_DISPO") > 0
                                                    THEN  MAX("xvw_ReportBlfrgMaterialBedarf"."OERTLICHKEIT_TX_DISPO")
      ELSE                                                MAX("xvw_ReportBlfrgMaterialBedarf"."OERTLICHKEIT_TX")
     END                                                           AS "MAX_OERTLICHKEIT_TX",
     "xvw_ReportBlfrgMaterialBedarf"."MATERIAL_ID"                 AS "MATERIAL_ID",
     MAX("xvw_ReportBlfrgMaterialBedarf"."MATERIAL_NM")            AS "MAX_MATERIAL_NM",
     MAX("xvw_ReportBlfrgMaterialBedarf"."MATERIAL_ICON_URL")      AS "MAX_MATERIAL_ICON_URL",
     SUM("xvw_ReportBlfrgMaterialBedarf"."AUSRUESTUNG_AZ")         AS "SUM_AUSRUESTUNG_AZ",
     MAX("xvw_ReportBlfrgMaterialBedarf"."LIEFERART_ID")           AS "MAX_LIEFERART_ID",
     "xvw_ReportBlfrgMaterialBedarf"."DOKUMENT_ID"                 AS "DOKUMENT_ID",
     MAX("xvw_ReportBlfrgMaterialBedarf"."DOKUMENT_TI")            AS "MAX_DOKUMENT_TI"
FROM
(
SELECT
     '1'             AS "LEVEL_SRT",
     'Gesamt'        AS "LEVEL",
     'Bedarf für:'   AS "LEVEL_LBL",
     '1'             AS "LEVEL_RNK",
     "mvw_BlfrgMaterialAllePos"."ANLASS_ID",
     "mvw_BlfrgMaterialAllePos"."ANLASS_NM",
     "mvw_BlfrgMaterialAllePos"."ANLASS_LOGO_URL",
     "mvw_BlfrgMaterialAllePos"."AUSTRAGUNG_ID",
     "mvw_BlfrgMaterialAllePos"."AUSTRAGUNG_DT",
     0               AS "SEKTOR_AKTIV_ID",
     0               AS "SEKTOR_SRT",
     ''              AS "SEKTOR_NM",
     ''              AS "SEKTOR_BZ",
     ''              AS "SEKTOR_LBL",
     ''              AS "POSITION_TX",
     0               AS "POSITION_ID",
     ''              AS "OERTLICHKEIT_TX",
     0               AS "POSITION_NR_DISPO",
     0               AS "POSITION_ID_DISPO",
     0               AS "VORSIGNAL_ID",
     ''              AS "OERTLICHKEIT_TX_DISPO",
     "mvw_BlfrgMaterialAllePos"."MATERIAL_ID",
     "mvw_BlfrgMaterialAllePos"."MATERIAL_NM",
     "mvw_BlfrgMaterialAllePos"."MATERIAL_ICON_URL",
     "mvw_BlfrgMaterialAllePos"."AUSRUESTUNG_AZ",
     "mvw_BlfrgMaterialAllePos"."LIEFERART_ID",
     "mvw_BlfrgMaterialAllePos"."DOKUMENT_ID",
     "mvw_BlfrgMaterialAllePos"."DOKUMENT_TI"
   FROM "StadtlaufBS"."mvw_BlfrgMaterialAllePos"
UNION ALL
SELECT
     '2'             AS "LEVEL_SRT",
     'Sektoren'      AS "LEVEL",
     'Bedarf für:'   AS "LEVEL_LBL",
     '1'             AS "LEVEL_RNK",
     "mvw_BlfrgMaterialAllePos"."ANLASS_ID",
     "mvw_BlfrgMaterialAllePos"."ANLASS_NM",
     "mvw_BlfrgMaterialAllePos"."ANLASS_LOGO_URL",
     "mvw_BlfrgMaterialAllePos"."AUSTRAGUNG_ID",
     "mvw_BlfrgMaterialAllePos"."AUSTRAGUNG_DT",
     "mvw_BlfrgMaterialAllePos"."SEKTOR_AKTIV_ID",
     "mvw_BlfrgMaterialAllePos"."SEKTOR_SRT",
     "mvw_BlfrgMaterialAllePos"."SEKTOR_NM",
     "mvw_BlfrgMaterialAllePos"."SEKTOR_BZ",
     'Sektor:'       AS "SEKTOR_LBL",
     ''              AS "POSITION_TX",
     0               AS "POSITION_ID",
     ''              AS "OERTLICHKEIT_TX",
     0               AS "POSITION_NR_DISPO",
     0               AS "POSITION_ID_DISPO",
     0               AS "VORSIGNAL_ID",
     ''              AS "OERTLICHKEIT_TX_DISPO",
     "mvw_BlfrgMaterialAllePos"."MATERIAL_ID",
     "mvw_BlfrgMaterialAllePos"."MATERIAL_NM",
     "mvw_BlfrgMaterialAllePos"."MATERIAL_ICON_URL",
     "mvw_BlfrgMaterialAllePos"."AUSRUESTUNG_AZ",
     "mvw_BlfrgMaterialAllePos"."LIEFERART_ID",
     "mvw_BlfrgMaterialAllePos"."DOKUMENT_ID",
     "mvw_BlfrgMaterialAllePos"."DOKUMENT_TI"
   FROM "StadtlaufBS"."mvw_BlfrgMaterialAllePos"
UNION ALL
SELECT
     '3'             AS "LEVEL_SRT",
     'Lieferorte'    AS "LEVEL",
     'Bedarf für:'   AS "LEVEL_LBL",
     '1'             AS "LEVEL_RNK",
     "mvw_BlfrgMaterialAllePos"."ANLASS_ID",
     "mvw_BlfrgMaterialAllePos"."ANLASS_NM",
     "mvw_BlfrgMaterialAllePos"."ANLASS_LOGO_URL",
     "mvw_BlfrgMaterialAllePos"."AUSTRAGUNG_ID",
     "mvw_BlfrgMaterialAllePos"."AUSTRAGUNG_DT",
     "mvw_BlfrgMaterialAllePos"."SEKTOR_AKTIV_ID",
     "mvw_BlfrgMaterialAllePos"."SEKTOR_SRT",
     "mvw_BlfrgMaterialAllePos"."SEKTOR_NM",
     "mvw_BlfrgMaterialAllePos"."SEKTOR_BZ",
     'Sektor:'       AS "SEKTOR_LBL",
     "mvw_BlfrgMaterialAllePos"."POSITION_TX",
     "mvw_BlfrgMaterialAllePos"."POSITION_ID",
     "mvw_BlfrgMaterialAllePos"."OERTLICHKEIT_TX",
     0               AS "POSITION_NR_DISPO",
     0               AS "POSITION_ID_DISPO",
     0               AS "VORSIGNAL_ID",
     ''              AS "OERTLICHKEIT_TX_DISPO",
     "mvw_BlfrgMaterialAllePos"."MATERIAL_ID",
     "mvw_BlfrgMaterialAllePos"."MATERIAL_NM",
     "mvw_BlfrgMaterialAllePos"."MATERIAL_ICON_URL",
     "mvw_BlfrgMaterialAllePos"."AUSRUESTUNG_AZ",
     "mvw_BlfrgMaterialAllePos"."LIEFERART_ID",
     "mvw_BlfrgMaterialAllePos"."DOKUMENT_ID",
     "mvw_BlfrgMaterialAllePos"."DOKUMENT_TI"
   FROM "StadtlaufBS"."mvw_BlfrgMaterialAllePos"
UNION ALL
SELECT
     '3'             AS "LEVEL_SRT",
     'Positionen'    AS "LEVEL",
     'Bedarf für:'   AS "LEVEL_LBL",
     '2'             AS "LEVEL_RNK",
     "mvw_BlfrgMaterialAllePos"."ANLASS_ID",
     "mvw_BlfrgMaterialAllePos"."ANLASS_NM",
     "mvw_BlfrgMaterialAllePos"."ANLASS_LOGO_URL",
     "mvw_BlfrgMaterialAllePos"."AUSTRAGUNG_ID",
     "mvw_BlfrgMaterialAllePos"."AUSTRAGUNG_DT",
     "mvw_BlfrgMaterialAllePos"."SEKTOR_AKTIV_ID",
     "mvw_BlfrgMaterialAllePos"."SEKTOR_SRT",
     "mvw_BlfrgMaterialAllePos"."SEKTOR_NM",
     "mvw_BlfrgMaterialAllePos"."SEKTOR_BZ",
     'Sektor:'       AS "SEKTOR_LBL",
     "mvw_BlfrgMaterialAllePos"."POSITION_TX",
     "mvw_BlfrgMaterialAllePos"."POSITION_ID",
     "mvw_BlfrgMaterialAllePos"."OERTLICHKEIT_TX",
     "mvw_BlfrgMaterialAllePos"."POSITION_NR_DISPO",
     "mvw_BlfrgMaterialAllePos"."POSITION_ID_DISPO",
     "mvw_BlfrgMaterialAllePos"."VORSIGNAL_ID",
     "mvw_BlfrgMaterialAllePos"."OERTLICHKEIT_TX_DISPO",
     "mvw_BlfrgMaterialAllePos"."MATERIAL_ID",
     "mvw_BlfrgMaterialAllePos"."MATERIAL_NM",
     "mvw_BlfrgMaterialAllePos"."MATERIAL_ICON_URL",
     "mvw_BlfrgMaterialAllePos"."AUSRUESTUNG_AZ",
     "mvw_BlfrgMaterialAllePos"."LIEFERART_ID",
     "mvw_BlfrgMaterialAllePos"."DOKUMENT_ID",
     "mvw_BlfrgMaterialAllePos"."DOKUMENT_TI"
   FROM "StadtlaufBS"."mvw_BlfrgMaterialAllePos"
)
AS "xvw_ReportBlfrgMaterialBedarf"
GROUP BY
     "xvw_ReportBlfrgMaterialBedarf"."ANLASS_ID",
     "xvw_ReportBlfrgMaterialBedarf"."AUSTRAGUNG_ID",
     "xvw_ReportBlfrgMaterialBedarf"."LEVEL_SRT",
     "xvw_ReportBlfrgMaterialBedarf"."LEVEL_RNK",
     "xvw_ReportBlfrgMaterialBedarf"."SEKTOR_AKTIV_ID",
     "xvw_ReportBlfrgMaterialBedarf"."POSITION_ID",
     "xvw_ReportBlfrgMaterialBedarf"."POSITION_ID_DISPO",
     "xvw_ReportBlfrgMaterialBedarf"."VORSIGNAL_ID",
     "xvw_ReportBlfrgMaterialBedarf"."MATERIAL_ID",
     "xvw_ReportBlfrgMaterialBedarf"."DOKUMENT_ID"
ORDER BY
     "MAX_ANLASS_NM",
     "xvw_ReportBlfrgMaterialBedarf"."ANLASS_ID",
     "MAX_AUSTRAGUNG_DT",
     "xvw_ReportBlfrgMaterialBedarf"."AUSTRAGUNG_ID",
     "MAX_SEKTOR_SRT",
     "xvw_ReportBlfrgMaterialBedarf"."SEKTOR_AKTIV_ID",
     "xvw_ReportBlfrgMaterialBedarf"."LEVEL_SRT",
     "xvw_ReportBlfrgMaterialBedarf"."LEVEL_RNK",
     "MAX_POSITION_TX",
     "xvw_ReportBlfrgMaterialBedarf"."POSITION_ID",
     "MAX_POSITION_NR_DISPO",
     "xvw_ReportBlfrgMaterialBedarf"."POSITION_ID_DISPO",
     "xvw_ReportBlfrgMaterialBedarf"."VORSIGNAL_ID",
     "MAX_OERTLICHKEIT_TX",
     "MAX_MATERIAL_NM",
     "xvw_ReportBlfrgMaterialBedarf"."MATERIAL_ID",
     "xvw_ReportBlfrgMaterialBedarf"."DOKUMENT_ID";

-- Lieferauftrag-Liste
CREATE
MATERIALIZED VIEW "StadtlaufBS"."mvw_ReportBlfrgMaterialLieferblattPos" AS
SELECT
     "mvw_BlfrgMaterialAllePos"."ANLASS_ID"                     AS "ANLASS_ID",
     MAX("mvw_BlfrgMaterialAllePos"."ANLASS_NM")                AS "MAX_ANLASS_NM",
     MAX("mvw_BlfrgMaterialAllePos"."ANLASS_LOGO_URL")          AS "MAX_ANLASS_LOGO_URL",
     "mvw_BlfrgMaterialAllePos"."AUSTRAGUNG_ID"                 AS "AUSTRAGUNG_ID",
     MAX("mvw_BlfrgMaterialAllePos"."AUSTRAGUNG_DT")            AS "MAX_AUSTRAGUNG_DT",
     "mvw_BlfrgMaterialAllePos"."SEKTOR_AKTIV_ID"               AS "SEKTOR_AKTIV_ID",
     MAX("mvw_BlfrgMaterialAllePos"."SEKTOR_SRT")               AS "MAX_SEKTOR_SRT",
     MAX("mvw_BlfrgMaterialAllePos"."SEKTOR_NM")                AS "MAX_SEKTOR_NM",
     MAX("mvw_BlfrgMaterialAllePos"."SEKTOR_BZ")                AS "MAX_SEKTOR_BZ",
     MAX("mvw_BlfrgMaterialAllePos"."SEKTOR_CHEF_NM")           AS "MAX_SEKTOR_CHEF_NM",
     MAX("mvw_BlfrgMaterialAllePos"."SEKTOR_ID")                AS "MAX_SEKTOR_ID",
     MAX("mvw_BlfrgMaterialAllePos"."SEKTOR_TYP_ID")            AS "MAX_SEKTOR_TYP_ID",
     MAX("mvw_BlfrgMaterialAllePos"."SEKTOR_TYP_BZ")            AS "MAX_SEKTOR_TYP_BZ",
     MAX("mvw_BlfrgMaterialAllePos"."PLAN_LIEFERORTE_URL")      AS "MAX_PLAN_LIEFERORTE_URL",
     MAX("mvw_BlfrgMaterialAllePos"."POLIZEI_ABTEILUNG_NM")     AS "MAX_POLIZEI_ABTEILUNG_NM",
     MAX("mvw_BlfrgMaterialAllePos"."POLIZEI_LOGO_URL")         AS "MAX_POLIZEI_LOGO_URL",
     "mvw_BlfrgMaterialAllePos"."POSITION_ID"                   AS "POSITION_ID",
     MAX("mvw_BlfrgMaterialAllePos"."POSITION_TX")              AS "MAX_POSITION_TX",
     MAX("mvw_BlfrgMaterialAllePos"."ORTSCHAFT_TX")             AS "MAX_ORTSCHAFT_TX",
     MAX("mvw_BlfrgMaterialAllePos"."OERTLICHKEIT_TX")          AS "MAX_OERTLICHKEIT_TX",
     MAX("mvw_BlfrgMaterialAllePos"."ABSCHNITT_TX")             AS "MAX_ABSCHNITT_TX",
     MAX("mvw_BlfrgMaterialAllePos"."SPERRE_AB_ZT")             AS "MAX_SPERRE_AB_ZT",
     MAX("mvw_BlfrgMaterialAllePos"."SPERRE_BIS_ZT")            AS "MAX_SPERRE_BIS_ZT",
     MAX("mvw_BlfrgMaterialAllePos"."AUFTRAG_ANW")              AS "MAX_AUFTRAG_ANW",
     MAX("mvw_BlfrgMaterialAllePos"."MASSNAHME_ANW")            AS "MAX_MASSNAHME_ANW",
     MAX("mvw_BlfrgMaterialAllePos"."AUFBAU_ANW")               AS "MAX_AUFBAU_ANW",
     CASE MAX("mvw_BlfrgMaterialAllePos"."DOKUMENT_ID")
      WHEN 3      THEN MAX("mvw_BlfrgMaterialAllePos"."AUFBAU_ANW")
      ELSE             MAX("mvw_BlfrgMaterialAllePos"."AUFTRAG_ANW")
     END                                                        AS "MAX_AUFTRAG_ANW_EFF",
     MAX("mvw_BlfrgMaterialAllePos"."SITUATION_BILD_URL")       AS "MAX_SITUATION_BILD_URL",
     "mvw_BlfrgMaterialAllePos"."LIEFERART_ID"                  AS "LIEFERART_ID",
     MAX("mvw_BlfrgMaterialAllePos"."LIEFERART_BZ")             AS "MAX_LIEFERART_BZ",
     "mvw_BlfrgMaterialAllePos"."DOKUMENT_ID"                   AS "DOKUMENT_ID",
     MAX("mvw_BlfrgMaterialAllePos"."DOKUMENT_PGM")             AS "MAX_DOKUMENT_PGM",
     MAX("mvw_BlfrgMaterialAllePos"."DOKUMENT_ERGAENZUNG_URL")  AS "MAX_DOKUMENT_ERGAENZUNG_URL",
     MAX("mvw_BlfrgMaterialAllePos"."DOKUMENT_TI")              AS "MAX_DOKUMENT_TI"
   FROM "StadtlaufBS"."mvw_BlfrgMaterialAllePos"
   GROUP BY
        "mvw_BlfrgMaterialAllePos"."ANLASS_ID",
        "mvw_BlfrgMaterialAllePos"."AUSTRAGUNG_ID",
        "mvw_BlfrgMaterialAllePos"."SEKTOR_AKTIV_ID",
        "mvw_BlfrgMaterialAllePos"."POSITION_ID",
        "mvw_BlfrgMaterialAllePos"."LIEFERART_ID",
        "mvw_BlfrgMaterialAllePos"."DOKUMENT_ID"
   ORDER BY
        MAX("mvw_BlfrgMaterialAllePos"."ANLASS_NM"),
        "mvw_BlfrgMaterialAllePos"."ANLASS_ID",
        MAX("mvw_BlfrgMaterialAllePos"."AUSTRAGUNG_DT"),
        "mvw_BlfrgMaterialAllePos"."AUSTRAGUNG_ID",
        MAX("mvw_BlfrgMaterialAllePos"."SEKTOR_SRT"),
        "mvw_BlfrgMaterialAllePos"."SEKTOR_AKTIV_ID",
        MAX("mvw_BlfrgMaterialAllePos"."POSITION_TX"),
        "mvw_BlfrgMaterialAllePos"."POSITION_ID",
        MAX("mvw_BlfrgMaterialAllePos"."OERTLICHKEIT_TX"),
        MAX("mvw_BlfrgMaterialAllePos"."LIEFERART_BZ"),
        "mvw_BlfrgMaterialAllePos"."LIEFERART_ID",
        "mvw_BlfrgMaterialAllePos"."DOKUMENT_ID";

CREATE
MATERIALIZED VIEW "StadtlaufBS"."mvw_ReportBlfrgMaterialLieferblattMaterial" AS
SELECT
     "mvw_BlfrgMaterialAllePos"."ANLASS_ID"                     AS "ANLASS_ID",
     "mvw_BlfrgMaterialAllePos"."AUSTRAGUNG_ID"                 AS "AUSTRAGUNG_ID",
     "mvw_BlfrgMaterialAllePos"."SEKTOR_AKTIV_ID"               AS "SEKTOR_AKTIV_ID",
     MAX("mvw_BlfrgMaterialAllePos"."SEKTOR_ID")                AS "MAX_SEKTOR_ID",
     "mvw_BlfrgMaterialAllePos"."POSITION_ID"                   AS "POSITION_ID",
     "mvw_BlfrgMaterialAllePos"."LIEFERART_ID"                  AS "LIEFERART_ID",
     MAX("mvw_BlfrgMaterialAllePos"."LIEFERART_BZ")             AS "MAX_LIEFERART_BZ",
     "mvw_BlfrgMaterialAllePos"."MATERIAL_ID"                   AS "MATERIAL_ID",
     MAX("mvw_BlfrgMaterialAllePos"."MATERIAL_NM")              AS "MAX_MATERIAL_NM",
     MAX("mvw_BlfrgMaterialAllePos"."MATERIAL_ICON_URL")        AS "MAX_MATERIAL_ICON_URL",
     SUM("mvw_BlfrgMaterialAllePos"."AUSRUESTUNG_AZ")           AS "SUM_AUSRUESTUNG_AZ",
     "mvw_BlfrgMaterialAllePos"."DOKUMENT_ID"                   AS "DOKUMENT_ID",
     MAX("mvw_BlfrgMaterialAllePos"."DOKUMENT_PGM")             AS "MAX_DOKUMENT_PGM",
     MAX("mvw_BlfrgMaterialAllePos"."DOKUMENT_ERGAENZUNG_URL")  AS "MAX_DOKUMENT_ERGAENZUNG_URL",
     MAX("mvw_BlfrgMaterialAllePos"."DOKUMENT_TI")              AS "MAX_DOKUMENT_TI"
   FROM "StadtlaufBS"."mvw_BlfrgMaterialAllePos"
   GROUP BY
        "mvw_BlfrgMaterialAllePos"."ANLASS_ID",
        "mvw_BlfrgMaterialAllePos"."AUSTRAGUNG_ID",
        "mvw_BlfrgMaterialAllePos"."SEKTOR_AKTIV_ID",
        "mvw_BlfrgMaterialAllePos"."POSITION_ID",
        "mvw_BlfrgMaterialAllePos"."LIEFERART_ID",
        "mvw_BlfrgMaterialAllePos"."MATERIAL_ID",
        "mvw_BlfrgMaterialAllePos"."DOKUMENT_ID"
   ORDER BY
        "mvw_BlfrgMaterialAllePos"."ANLASS_ID",
        "mvw_BlfrgMaterialAllePos"."AUSTRAGUNG_ID",
        "mvw_BlfrgMaterialAllePos"."SEKTOR_AKTIV_ID",
        "mvw_BlfrgMaterialAllePos"."POSITION_ID",
        MAX("mvw_BlfrgMaterialAllePos"."LIEFERART_BZ"),
        "mvw_BlfrgMaterialAllePos"."LIEFERART_ID",
        MAX("mvw_BlfrgMaterialAllePos"."MATERIAL_NM"),
        "mvw_BlfrgMaterialAllePos"."MATERIAL_ID",
        "mvw_BlfrgMaterialAllePos"."DOKUMENT_ID";


GRANT USAGE ON SCHEMA "StadtlaufBS" TO pentahorep;
GRANT SELECT
  ON ALL TABLES IN SCHEMA "StadtlaufBS"
  TO pentahorep;
