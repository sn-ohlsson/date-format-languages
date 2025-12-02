module DateFormat.Languages exposing
    ( Language
    , english, spanish, dutch, swedish, portuguese, french, finnish, norwegian, norwegianNynorsk, greek, italian, slovenian
    , DateLanguage, toDateLanguage
    )

{-|


## Fun fact: Some people don't know english.

That's why it's important to include alternative date formatting options for other languages!

This module exposes `Language` (compatible with `ryannhg/date-format`) and `DateLanguage` (compatible with `justinmimbs/date`), along with a few implementations.

(If you want to see `german` or `swahili`, please add them in! I'm happy to make your language a part of the package!)


### Language

@docs Language


### Languages

@docs english, spanish, dutch, swedish, portuguese, french, finnish, norwegian, norwegianNynorsk, greek, italian, slovenian


### Compatibility

@docs DateLanguage, toDateLanguage

-}

import Time exposing (Month(..), Weekday(..))


{-| A record with options for your language. Compatible with `ryannhg/date-format`.
-}
type alias Language =
    { toMonthName : Month -> String
    , toMonthAbbreviation : Month -> String
    , toWeekdayName : Weekday -> String
    , toWeekdayAbbreviation : Weekday -> String
    , toAmPm : Int -> String
    , toOrdinalSuffix : Int -> String
    }



-- English


toEnglishMonthName : Month -> String
toEnglishMonthName month =
    case month of
        Jan ->
            "January"

        Feb ->
            "February"

        Mar ->
            "March"

        Apr ->
            "April"

        May ->
            "May"

        Jun ->
            "June"

        Jul ->
            "July"

        Aug ->
            "August"

        Sep ->
            "September"

        Oct ->
            "October"

        Nov ->
            "November"

        Dec ->
            "December"


toEnglishWeekdayName : Weekday -> String
toEnglishWeekdayName weekday =
    case weekday of
        Mon ->
            "Monday"

        Tue ->
            "Tuesday"

        Wed ->
            "Wednesday"

        Thu ->
            "Thursday"

        Fri ->
            "Friday"

        Sat ->
            "Saturday"

        Sun ->
            "Sunday"


toEnglishAmPm : Int -> String
toEnglishAmPm hour =
    if hour > 11 then
        "pm"

    else
        "am"


toEnglishSuffix : Int -> String
toEnglishSuffix num =
    case modBy 100 num of
        11 ->
            "th"

        12 ->
            "th"

        13 ->
            "th"

        _ ->
            case modBy 10 num of
                1 ->
                    "st"

                2 ->
                    "nd"

                3 ->
                    "rd"

                _ ->
                    "th"


{-| The english language! (used by default)
-}
english : Language
english =
    Language
        toEnglishMonthName
        (toEnglishMonthName >> String.left 3)
        toEnglishWeekdayName
        (toEnglishWeekdayName >> String.left 3)
        toEnglishAmPm
        toEnglishSuffix



-- Spanish


{-| The spanish language!
-}
spanish : Language
spanish =
    Language
        toSpanishMonthName
        (toSpanishMonthName >> String.left 3)
        toSpanishWeekdayName
        (toSpanishWeekdayName >> String.left 3)
        toEnglishAmPm
        (always "°")


toSpanishMonthName : Time.Month -> String
toSpanishMonthName month =
    case month of
        Jan ->
            "Enero"

        Feb ->
            "Febrero"

        Mar ->
            "Marzo"

        Apr ->
            "Abril"

        May ->
            "Mayo"

        Jun ->
            "Junio"

        Jul ->
            "Julio"

        Aug ->
            "Agosto"

        Sep ->
            "Septiembre"

        Oct ->
            "Octubre"

        Nov ->
            "Noviembre"

        Dec ->
            "Diciembre"


toSpanishWeekdayName : Time.Weekday -> String
toSpanishWeekdayName weekday =
    case weekday of
        Mon ->
            "Lunes"

        Tue ->
            "Martes"

        Wed ->
            "Miércoles"

        Thu ->
            "Jueves"

        Fri ->
            "Viernes"

        Sat ->
            "Sábado"

        Sun ->
            "Domingo"



-- Dutch


{-| The dutch language!
-}
dutch : Language
dutch =
    Language
        toDutchMonthName
        (toDutchMonthName >> String.left 3)
        toDutchWeekdayName
        (toDutchWeekdayName >> String.left 3)
        toEnglishAmPm
        toDutchSuffix


toDutchMonthName : Time.Month -> String
toDutchMonthName month =
    case month of
        Jan ->
            "januari"

        Feb ->
            "februari"

        Mar ->
            "maart"

        Apr ->
            "april"

        May ->
            "mei"

        Jun ->
            "juni"

        Jul ->
            "juli"

        Aug ->
            "augustus"

        Sep ->
            "september"

        Oct ->
            "oktober"

        Nov ->
            "november"

        Dec ->
            "december"


toDutchWeekdayName : Time.Weekday -> String
toDutchWeekdayName weekday =
    case weekday of
        Mon ->
            "maandag"

        Tue ->
            "dinsdag"

        Wed ->
            "woensdag"

        Thu ->
            "donderdag"

        Fri ->
            "vrijdag"

        Sat ->
            "zaterdag"

        Sun ->
            "zondag"


toDutchSuffix : Int -> String
toDutchSuffix num =
    if num > 20 || num == 1 || num == 8 then
        "ste"

    else
        "de"



-- Swedish


{-| The Swedish language!
-}
swedish : Language
swedish =
    Language
        toSwedishMonthName
        (toSwedishMonthName >> String.left 3)
        toSwedishWeekdayName
        (toSwedishWeekdayName >> String.left 3)
        toEnglishAmPm
        (\_ -> "")


toSwedishMonthName : Time.Month -> String
toSwedishMonthName month =
    case month of
        Jan ->
            "januari"

        Feb ->
            "februari"

        Mar ->
            "mars"

        Apr ->
            "april"

        May ->
            "maj"

        Jun ->
            "juni"

        Jul ->
            "juli"

        Aug ->
            "augusti"

        Sep ->
            "september"

        Oct ->
            "oktober"

        Nov ->
            "november"

        Dec ->
            "december"


toSwedishWeekdayName : Time.Weekday -> String
toSwedishWeekdayName weekday =
    case weekday of
        Mon ->
            "måndag"

        Tue ->
            "tisdag"

        Wed ->
            "onsdag"

        Thu ->
            "torsdag"

        Fri ->
            "fredag"

        Sat ->
            "lördag"

        Sun ->
            "söndag"



-- Portuguese


{-| The Portuguese language!
-}
portuguese : Language
portuguese =
    Language
        toPortugueseMonthName
        (toPortugueseMonthName >> String.left 3)
        toPortugueseWeekdayName
        (toPortugueseWeekdayName >> String.left 3)
        toEnglishAmPm
        (always "°")


toPortugueseMonthName : Time.Month -> String
toPortugueseMonthName month =
    case month of
        Jan ->
            "Janeiro"

        Feb ->
            "Fevereiro"

        Mar ->
            "Março"

        Apr ->
            "Abril"

        May ->
            "Maio"

        Jun ->
            "Junho"

        Jul ->
            "Julho"

        Aug ->
            "Agosto"

        Sep ->
            "Setembro"

        Oct ->
            "Outubro"

        Nov ->
            "Novembro"

        Dec ->
            "Dezembro"


toPortugueseWeekdayName : Time.Weekday -> String
toPortugueseWeekdayName weekday =
    case weekday of
        Mon ->
            "Segunda"

        Tue ->
            "Terça"

        Wed ->
            "Quarta"

        Thu ->
            "Quinta"

        Fri ->
            "Sexta"

        Sat ->
            "Sábado"

        Sun ->
            "Domingo"



-- French


{-| The French language!
-}
french : Language
french =
    Language
        toFrenchMonthName
        toFrenchMonthAbbreviation
        toFrenchWeekdayName
        (toFrenchWeekdayName >> String.left 3)
        toEnglishAmPm
        toFrenchOrdinalSuffix


toFrenchMonthName : Month -> String
toFrenchMonthName month =
    case month of
        Jan ->
            "janvier"

        Feb ->
            "février"

        Mar ->
            "mars"

        Apr ->
            "avril"

        May ->
            "mai"

        Jun ->
            "juin"

        Jul ->
            "juillet"

        Aug ->
            "août"

        Sep ->
            "septembre"

        Oct ->
            "octobre"

        Nov ->
            "novembre"

        Dec ->
            "décembre"


toFrenchMonthAbbreviation : Month -> String
toFrenchMonthAbbreviation month =
    case month of
        Jan ->
            "janv"

        Feb ->
            "févr"

        Mar ->
            "mars"

        Apr ->
            "avr"

        May ->
            "mai"

        Jun ->
            "juin"

        Jul ->
            "juil"

        Aug ->
            "août"

        Sep ->
            "sept"

        Oct ->
            "oct"

        Nov ->
            "nov"

        Dec ->
            "déc"


toFrenchWeekdayName : Weekday -> String
toFrenchWeekdayName weekday =
    case weekday of
        Mon ->
            "lundi"

        Tue ->
            "mardi"

        Wed ->
            "mercredi"

        Thu ->
            "jeudi"

        Fri ->
            "vendredi"

        Sat ->
            "samedi"

        Sun ->
            "dimanche"


toFrenchOrdinalSuffix : Int -> String
toFrenchOrdinalSuffix n =
    if n == 1 then
        "er"

    else
        "e"



-- Finnish


toFinnishMonthName : Month -> String
toFinnishMonthName month =
    case month of
        Jan ->
            "tammikuu"

        Feb ->
            "helmikuu"

        Mar ->
            "maaliskuu"

        Apr ->
            "huhtikuu"

        May ->
            "toukokuu"

        Jun ->
            "kesäkuu"

        Jul ->
            "heinäkuu"

        Aug ->
            "elokuu"

        Sep ->
            "syyskuu"

        Oct ->
            "lokakuu"

        Nov ->
            "marraskuu"

        Dec ->
            "joulukuu"


toFinnishWeekdayName : Weekday -> String
toFinnishWeekdayName weekday =
    case weekday of
        Mon ->
            "maanantai"

        Tue ->
            "tiistai"

        Wed ->
            "keskiviikko"

        Thu ->
            "torstai"

        Fri ->
            "perjantai"

        Sat ->
            "lauantai"

        Sun ->
            "sunnuntai"


{-| Only 24h formats are used in the Finnish language. AM/PM do technically have translations,
but using them would go against the [guidelines](http://www.kielitoimistonohjepankki.fi/ohje/51).
-}
toFinnishAmPm : Int -> String
toFinnishAmPm _ =
    ""


toFinnishSuffix : Int -> String
toFinnishSuffix _ =
    "."


{-| The Finnish language!
-}
finnish : Language
finnish =
    Language
        toFinnishMonthName
        (toFinnishMonthName >> String.replace "kuu" "")
        toFinnishWeekdayName
        (toFinnishWeekdayName >> String.left 2)
        toFinnishAmPm
        toFinnishSuffix



-- Norwegian


{-| The Norwegian language!
Note: bokmål only, use `norwegianNynorsk` for nynorsk.
-}
norwegian : Language
norwegian =
    Language
        toNorwegianMonthName
        (toNorwegianMonthName >> String.left 3)
        toNorwegianWeekdayName
        (toNorwegianWeekdayName >> String.left 3)
        toNorwegianAmPm
        toNorwegianOrdinalSuffix


{-| The Norwegian language 
Note: nynorsk only, use `norwegian` for bokmål.
-}
norwegianNynorsk : Language
norwegianNynorsk =
    Language
        toNorwegianMonthName
        (toNorwegianMonthName >> String.left 3)
        toNorwegianNynorskWeekdayName
        (toNorwegianNynorskWeekdayName >> String.left 3)
        toNorwegianAmPm
        toNorwegianOrdinalSuffix


toNorwegianMonthName : Time.Month -> String
toNorwegianMonthName month =
    case month of
        Jan ->
            "januar"

        Feb ->
            "februar"

        Mar ->
            "mars"

        Apr ->
            "april"

        May ->
            "mai"

        Jun ->
            "juni"

        Jul ->
            "juli"

        Aug ->
            "august"

        Sep ->
            "september"

        Oct ->
            "oktober"

        Nov ->
            "november"

        Dec ->
            "desember"


toNorwegianWeekdayName : Time.Weekday -> String
toNorwegianWeekdayName weekday =
    case weekday of
        Mon ->
            "mandag"

        Tue ->
            "tirsdag"

        Wed ->
            "onsdag"

        Thu ->
            "torsdag"

        Fri ->
            "fredag"

        Sat ->
            "lørdag"

        Sun ->
            "søndag"


toNorwegianNynorskWeekdayName : Time.Weekday -> String
toNorwegianNynorskWeekdayName weekday =
    case weekday of
        Mon ->
            "måndag"

        Tue ->
            "tysdag"

        Wed ->
            "onsdag"

        Thu ->
            "torsdag"

        Fri ->
            "fredag"

        Sat ->
            "laurdag"

        Sun ->
            "søndag"


toNorwegianAmPm : Int -> String
toNorwegianAmPm _ =
    -- Norwegian uses 24h formatting only.
    ""


toNorwegianOrdinalSuffix : Int -> String
toNorwegianOrdinalSuffix _ =
    "."



-- Greek


toGreekMonthName : Month -> String
toGreekMonthName month =
    case month of
        Jan ->
            "Ιανουαρίου"

        Feb ->
            "Φεβρουαρίου"

        Mar ->
            "Μαρτίου"

        Apr ->
            "Απριλίου"

        May ->
            "Μαΐου"

        Jun ->
            "Ιουνίου"

        Jul ->
            "Ιουλίου"

        Aug ->
            "Αυγούστου"

        Sep ->
            "Σεπτεμβρίου"

        Oct ->
            "Οκτωβρίου"

        Nov ->
            "Νοεμβρίου"

        Dec ->
            "Δεκεμβρίου"


toGreekWeekdayName : Weekday -> String
toGreekWeekdayName weekday =
    case weekday of
        Mon ->
            "Δευτέρα"

        Tue ->
            "Τρίτη"

        Wed ->
            "Τετάρτη"

        Thu ->
            "Πέμπτη"

        Fri ->
            "Παρασκευή"

        Sat ->
            "Σάββατο"

        Sun ->
            "Κυριακή"


toGreekAmPm : Int -> String
toGreekAmPm hour =
    if hour > 11 then
        "μμ"

    else
        "πμ"


toGreekSuffix : Int -> String
toGreekSuffix num =
    "η"


{-| The greek language!
-}
greek : Language
greek =
    Language
        toGreekMonthName
        (\month ->
            if List.member month [ Jun, Jul ] then
                (toGreekMonthName >> String.left 4) month

            else
                (toGreekMonthName >> String.left 3) month
        )
        toGreekWeekdayName
        (toGreekWeekdayName >> String.left 3)
        toGreekAmPm
        toGreekSuffix



-- Italian


toItalianMonthName : Month -> String
toItalianMonthName month =
    case month of
        Jan ->
            "Gennaio"

        Feb ->
            "Febbraio"

        Mar ->
            "Marzo"

        Apr ->
            "Aprile"

        May ->
            "Maggio"

        Jun ->
            "Giugno"

        Jul ->
            "Luglio"

        Aug ->
            "Agosto"

        Sep ->
            "Settembre"

        Oct ->
            "Ottobre"

        Nov ->
            "Novembre"

        Dec ->
            "Dicembre"


toItalianWeekdayName : Weekday -> String
toItalianWeekdayName weekday =
    case weekday of
        Mon ->
            "Lunedì"

        Tue ->
            "Martedì"

        Wed ->
            "Mercoledì"

        Thu ->
            "Giovedì"

        Fri ->
            "Venerdì"

        Sat ->
            "Sabato"

        Sun ->
            "Domenica"


toItalianAmPm : Int -> String
toItalianAmPm hour =
    if hour > 11 then
        "PM"

    else
        "AM"


toItalianSuffix : Int -> String
toItalianSuffix num =
    ""


{-| The italian language!
-}
italian : Language
italian =
    Language
        toItalianMonthName
        (\month ->
            if List.member month [ Jun, Jul ] then
                (toItalianMonthName >> String.left 4) month

            else
                (toItalianMonthName >> String.left 3) month
        )
        toItalianWeekdayName
        (toItalianWeekdayName >> String.left 3)
        toItalianAmPm
        toItalianSuffix



-- Slovenian


{-| The slovenian language!
-}
slovenian : Language
slovenian =
    Language
        toSlovenianMonthName
        (toSlovenianMonthName >> String.left 3)
        toSlovenianWeekdayName
        (toSlovenianWeekdayName >> String.left 3)
        toEnglishAmPm
        (\_ -> "")


toSlovenianMonthName : Time.Month -> String
toSlovenianMonthName month =
    case month of
        Jan ->
            "januar"

        Feb ->
            "februar"

        Mar ->
            "marec"

        Apr ->
            "april"

        May ->
            "maj"

        Jun ->
            "junij"

        Jul ->
            "julij"

        Aug ->
            "avgust"

        Sep ->
            "september"

        Oct ->
            "oktober"

        Nov ->
            "november"

        Dec ->
            "december"


toSlovenianWeekdayName : Weekday -> String
toSlovenianWeekdayName weekday =
    case weekday of
        Mon ->
            "ponedeljek"

        Tue ->
            "torek"

        Wed ->
            "sreda"

        Thu ->
            "četrtek"

        Fri ->
            "petek"

        Sat ->
            "sobota"

        Sun ->
            "nedelja"



-- COMPATIBILITY with justinmimbs/date


{-| A record with options for your language. Compatible with `justinmimbs/date`.
-}
type alias DateLanguage =
    { monthName : Month -> String
    , monthNameShort : Month -> String
    , weekdayName : Weekday -> String
    , weekdayNameShort : Weekday -> String
    , dayWithSuffix : Int -> String
    }


{-| This converts a `Language` do a `DateLanguage`
-}
toDateLanguage : Language -> DateLanguage
toDateLanguage { toMonthName, toMonthAbbreviation, toWeekdayName, toWeekdayAbbreviation, toOrdinalSuffix } =
    { monthName = toMonthName
    , monthNameShort = toMonthAbbreviation
    , weekdayName = toWeekdayName
    , weekdayNameShort = toWeekdayAbbreviation
    , dayWithSuffix = \n -> String.fromInt n ++ toOrdinalSuffix n
    }
