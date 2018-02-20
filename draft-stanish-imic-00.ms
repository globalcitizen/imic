.\"
.\"
.\"     David M. Meyer
.\"     dmm@1-4-5.net
.\"     
.\"     
.\"     Fill in Author?, -abc, category, ...
.\"
.\"
.\"     $Header: /home/dmm/SDOs/IETF/Drafts/generic_draft/RCS/draft-ietf-abc.ms,v 1.19 2004/09/28 13:50:35 dmm Exp $
.\"
.\"
.\"
.so tmac.id
.tl 'INTERNET-DRAFT''Walter Stanish'
.tl 'Intended status: Experimental''Payward Inc.'
.tl 'Obsoletes: draft-imic-00''\*(MO \n[*xyear]'
.tl 'Expires: \*[*XP]'''
.LP
.ce 2
Internet Market Identification Code (IMIC)
draft-stanish-imic-00

.LP
.B Abstract
.LP
.in 3

An Internet MIC (IMIC) identifies an internet-based financial market
in a manner that is superset-compatible with the ISO's existing Market 
Identification Code (MIC) standard [ISO10383].  This document obsoletes
draft-iiban-00.

.\".IDBOILER "IMIC working group" "imic@x.y.z"
.IDBOILER "i"
.\"  if product of individual
.\"

.COPYSTATEMENT

.LP
.KS

.LP
.MH 1 Introduction
.LP
.in 3

An Internet MIC (IMIC) is a four-character alphanumeric code, always
beginning with a leading digit, that identifies an internet-based 
financial market in an interoperable manner with [ISO1383] MICs.
No assumptions are made about settlement paths or the currencies or 
commodities exchanged on the market.  IMIC provides a building block
with which the internet community can develop viable, interoperable 
alternatives to legacy financial systems.

Technically, IMIC is an unofficial superset of the ISO's existing Market
Identification Code standard [ISO10383] that is widely used for global
identification of conventional financial exchanges.  Against the ISO's MIC
registry [MIC-REG], IANA assumes name space management rights for codes
beginning with the digits 0-9 in order to obtain an adequate name space
with which to provide a financial market registrar service for the 
internet community.

.RFC2119

.KE
.LP
.bp
.TOCP
.bp

.LP
.MH 1 Requirement
.LP
.in 3

In recent years the internet has seen the emergence of online markets
trading in both conventional and novel [BITCOIN] financial instruments.  

Given this trend, it makes sense to propose a standard mechanism for
the consistent, global identification of internet-based markets.  IMIC
provides such a mechanism.

.LP
.MH 1 "Solution"
.MH 2 "ISO10383 (MIC)"
.LP
.in 3

For inspiration we look toward present standards for the global identification
of financial markets and exchanges in conventional financial networks.
Today's most widely widely adopted international standard in this area
is the International Standards Organizations's Market Identification
Code (MIC) [ISO10383].

In practice, a MIC is simply a unique series of four alphanumeric 
characters that is associated with a given market by publishing it
within the ISO's Market Identification Code registry [MIC-REG].

.LP
.MH 2 "IMIC"
.LP
.in 3

In order to issue financial endpoint identifiers within the MIC [ISO10383]
scheme IANA assumes management of the portion of the name space beginning
with the digits 0-9.  IMIC thus becomes superset-compatible with MIC.

The IMIC format may be expressed in ABNF [RFC5234] as follows:

 imic         = digit 3char          ; eg: 0I7E
 mic          = caps-letter 3char    ; eg: XTAF

 char         = digit / caps-letter
 digit        = "0" / "1" / "2" / "3" / "4" / "5" / "6" / "7" / "8" /
                "9"
 caps-letter  = %d65 / %d66 / %d67 / %d68 / %d69 / %d70 / %d71 /
                %d72 / %d73 / %d74 / %d75 / %d76 / %d77 / %d78 /
                %d79 / %d80 / %d81 / %d82 / %d83 / %d84 / %d85 /
                %d86 / %d87 / %d88 / %d89 / %d90   ; ie. capital A-Z

Of the assumed name space, only codes with the zero (0) prefix are 
initially considered assignable by IANA, with the remainder reserved
for private or future use as summarized below.

 +--------+-------+------+----------------------------+------------+
 | Prefix | Auth. | Std. | Description                | Codepoints |
 +--------+-------+------+----------------------------+------------+
 | 0000   | IANA  | IMIC | Local (or default) market  |          1 |
 | 0      | IANA  | IMIC | IANA assignable name space |     46,655 |
 | 10     | IANA  | IMIC | Private use                |      1,296 |
 | 11-1Z  | IANA  | IMIC | (Reserved for future use)  |     45,360 |
 | 2-9    | IANA  | IMIC | (Reserved for future use)  |    373,248 |
 | A-Z    | ISO   | MIC  | ISO managed name space     |  1,213,056 |
 +--------+-------+------+----------------------------+------------+

.LP
.MH 1 "General Considerations"
.MH 2 "Namespace Prefix"
.LP
.in 3

ISO's Market Information Code (MIC) registry document [MIC-REG] contains
assignments spanning approximately eight years, yet contains only a single
MIC that has ever been issued with leading digits.  IANA may thus
subsume management of the portion of the name space beginning with the 
digits 0-9.

Within this name space, a strong candidate for an initial prefix from 
which IANA may issue IMIC assignements is zero ('0').  Zero is considered
particularly attractive for the following reasons:

 * It is unlikely that a conventional market will be submitted for
   reistration to the official ISO4217 assignment space that is best
   identified with a leading '0'.

 * '0' will appear above legacy market identifiers in alphabetically
   sorted destination lists.

 * '0' arguably reduces recognition complexity for international locales.

 * The digit '0' tends to have digital connotations.

IMIC therefore reserves the name space defined by any leading digit for
assignment by IANA, but employs '0' as the initial prefix for assignments.

.MH 2 "Identifier Issuing Paradigms"
.MH 3 "Distributed Hash Table (DHT)"
.LP
.in 3

Using distributed hash tables (DHT) or a similar mechanism it may
be possible to provide dynamic identifier name space management within
a financial network itself, such that individual markets can self-issue
IMICs and have them corroborated by network consensus.

Drawbacks to this approach include:

 * The 'always on, always connected' requirement of most of these
   architectures.

 * The 'endpoint exposure' problem.
   IP addresses for critical financial systems or their proxies
   are generally made available to a DHT network, which MAY not
   be desirable in a financial services setting.

 * Namespace exhaustion.
   Without some underlying capability for reliable network 
   participant identification, a single party COULD request vast
   quantities of identifiers in a bid to disrupt the network through
   name space exhaustion or processing overhead, causing Denial of 
   Service (DoS).

The primary benefit of a DHT-based approach is that it is completely 
decentralized, thus avoiding issues associated with centralization.

In future, part of the reserved name space might be considered for
assignment to a DHT-style self-managing peer to peer network.

.LP
.MH 3 "Private Issue"
.LP
.in 3

Just as the Internet Protocol provides a mechanism for Address Allocation
for Private Internets [RFC1918], so too IMIC provides a mechanism
for address allocation for private financial networks.  Private financial
networks MAY include those operated associated with Massive Multiplayer
Online Roleplaying Games (MMORPGs) or financial simulations.

For this reason, the prefix '10' (in deference to IPv4's well known
10.x.x.x range [RFC1918]) is allocated for private use, with a total of
1,296 codepoints.

.LP
.MH 3 "Combined Issue"
.LP
.in 3

Various approaches have been discussed with reference to their individual
benefits and drawbacks.  A combined process allows these to be balanced
against other requirements, such as IANA's need to perform name space 
management.  Under the IMIC scheme, provision for privately issued addresses
is included, top-level institution registration is managed by IANA, and 
future assignments COULD provide DHT or similar mechanisms for the
management of a delegated name space to users desirous of such services.

.LP
.MH 2 "Why Markets?"
.LP
.in 3

With the advent of truly decentralized virtual currencies such as [BITCOIN]
the conventional idea of a financial market (such as a stock exchange) MAY
be seen by some as superfluous.  However, the notion remains useful:

 * Consolidated instruments such as corporate stock require a degree 
   of centralization in order to maintain rapid settlement of trades

 * Multi-currency or multi-instrument markets will require support
   for conventional currencies whose immediate settlement is 
   difficult or impossible in many situations.

 * Systems such as [BITCOIN] have quirks that require slightly
   delayed settlement due to the nature of their decentralized,
   consensus-based approach to fiscal transfer.

.LP
.MH 2 "Number of Markets"
.LP
.in 3

The present ISO Market Identification Code (MIC) database contains
794 'live' codes.  We therefore assume a requirement to support at 
least a few thousand market codes.  We claim 466,560 codepoints from
ISO's existing name space (prefixes 0-9), and activate 46,656 (10%)
under the prefix zero ('0') for immediate assignment.

.bp
.LP
.MH 1 "Security Considerations"

IMIC only provides a financial market identification scheme and
DOES NOT approach problems of communications security, which are
purposefully left to other protocols.  Other than IANA processes
regarding registration, maintenance, expiry of registrant 
codepoints and the potential for name space exhaustion, no
security security considerations are felt to apply.

.LP
.MH 1 "IANA Considerations"
.MH 2 "Market Identifiers"
.MH 3 "Reserved IMIC"
.in 3

The following IMIC are reserved and MUST NOT be issued to registrants.

 +------+----------------------------------------+
 | IMIC | Purpose                                |
 +------+----------------------------------------+
 | 0000 | Denotes the local (or default) market. |
 +------+----------------------------------------+

Implementers should note that the precise meaning of '0000' is 
system-specific and as such it MUST NOT be used in inter-system 
communications except by explicit prior arrangement.  (See also
Appendix A: Special Purpose MIC Values).

.MH 3 "Registration"
.in 3

Internet MICs (IMICs) MUST be assigned by IANA on a first come first
served basis [RFC5226].  IMICs SHOULD NOT be provided to entities
with existing MICs, as this would represent duplicate allocation 
under the MIC standard.  Such entities MUST be defined as those 
appearing within SWIFT's official MIC registry [MIC-REG].
Registrants MUST provide the domain name with which their service is
primarily associated and the name of the registrant (either a person
or an organizational entity).  Registrants MAY provide a physical
address, and MAY provide one additional identifier such as a
business registration or license number.

IMICs MUST be assigned randomly from the pool of
available assignments and MUST NOT be granted on a specific request
basis.  Thus, the first issued institution code MUST NOT be '001'.
Institutions unhappy with their random assignment for legitimate
reasons (such as unfortunate numerological connotations) MAY request
one (1) replacement assignment.  No further replacement is allowed.
Registrants requesting replacement assignments automatically cause
their initial allocation to expire (see Expiry, below).

.MH 3 "Modification / Cancellation"
.in 3

Registrants MUST contact IANA to cancel or change the details
associated with their registration.  Authentication procedures will
be stipulated at IANA's discression.

.MH 3 "Expiry"
.in 3

In case of imminent name space exhaustion and no viable alternative
avenues for expansion, IANA MAY consider the expiry of a
registrant's stated primary domain for a reasonable period (as
determined by IANA) as adequate grounds for the deallocation of
an IMIC.  Deallocated IMIC MUST be immediately returned to the 
pool of available allocations, and MUST be re-issued to new 
parties on a first come, first served [RFC5226] basis.

.MH 2 "Publications"

.MH 3 "IMIC Market Identifier Registry"
.in 3

IANA SHALL publish revisions to the global registry of IMIC
institution identifiers as changes are made.  The registry SHALL include
date of registration and date of last modification of each record, in
addition to registrant information and the assigned institution code.

.MH 2 "Future Considerations"
.in 3

In future, part of the reserved name space might be considered for
assignment to a DHT-style self-managing peer to peer network.

.MH 2 "ISO Liason"
.in 3

In the future, at IANA's discretion, it may be worthwhile for 
the sake of preventing double assignment to contact the ISO's
ISO10383 managing authority (SWIFT) via http://www.iso15022.org/
and advise them of leading-digit MIC name space utilization.

.MH 2 "Security"
.in 3

IANA MUST provide adequate authentication of registrant institution
communications in order to prevent the subversion of established
institutions' registration information via IANA's registrar functions.
As IANA is likely to have superior experience in this domain, specific
procedures are left to IANA's judgement.

.bp
.LP
.MH 1 "References"
.MH 2 "Normative References"
.LP
.in 3

[ISO10383]      ISO TC 68/SC 4 (Securities and related financial 
                instruments), "ISO 10383:2003: Securities and 
                related financial instruments - Codes for exchanges 
                and market identification (MIC)", ISO10383:2003.
                http://www.iso.org/iso/catalogue_detail?
                 csnumber=33444

[MIC-REG]       SWIFT, "ISO10383, Codes for exchanges and market
                identification", October 3rd, 2011.
                http://www.iso15022.org/MIC/homepageMIC.htm

[RFC2119]       Bradner, S., "Key words for use in RFCs to
                Indicate Requirement Levels", BCP 14, RFC 2119,
                March 1997.  

[RFC5226]       Narten, T., and H. Alvestrand, "Guidelines for
                Writing an IANA Considerations Section in RFCs",
                BCP 26, RFC 5226, May 2008.

[RFC5234]       Crocker, D. and P. Overell, "Augmented BNF for
                Syntax Specifications: ABNF", STD 68, RFC 5234,
                January 2008.

.fi
.LP
.MH 2 "Informative References"
.LP
.in 3

.nf

[BITCOIN]       Nakamoto, S., "Bitcoin: A Peer-to-Peer Electronic
                Cash System", 2009-05-24.
                http://www.bitcoin.org/bitcoin.pdf

[RFC1918]       Rekhter, Y. et al, "Address Allocation for Private
                Internets", BCP 5, RFC 1918, Feburary 1996.
.fi

.bp

.LP
.MH 1 "Acknowledgments"
.LP
.in 3

 * Payward Inc. funded the research and development of this document.

.MH 1 "Authors' Addresses"
.DS L
.in 3

Walter Stanish
Payward Inc.
<walter@stani.sh>
.DE
.COPYFULL

.bp

.MH 1 "Appendices"
.MH 2 "Appendix A: Special Purpose MIC Values"
.in 3

The Market Identification Code (MIC) registry [MIC-REG] specifies the
following special values of which implementers should be aware.

 +------+--------------------------------------+
 | MIC  | Purpose                              |
 +------+--------------------------------------+
 | XXXX | No market (eg: unlisted securities)  |
 +------+--------------------------------------+

.bp

.MH 2 "Appendix B: Initial IMIC Market Identifier Registry Contents"
.in 3

Prior to IANA handover, parties wishing to acquire an instutition
identifier may do so by contacting the IFEX Project via ifex-project.org

.PP
.in 0
 # IMIC Market Identifier Registry / version: 20121113-0
 #  (Version format is <yyyy><mm><dd>-<x>, where <x> is a single digit.)
 #
 # Format: <code>|<is-meta>|<is-confirmed>|<short-name>|<primary-domain>
 #   <code>           The IMIC code.
 #   <is-meta>        Boolean. 1 denotes a meta-assignment
 #                    (ie. NOT a normal market codepoint)
 #   <short-name>     A short, unambiguous market name that is
 #                    suitable to display to end users.
 #   <primary-domain> The primary domain name that is associated
 #                    with the codepoint assignment.
 # Note:
 #  Prior to IANA handover, codepoint owners or registrants can
 #  temporarily correspond via the IFEX Project at 
 #  http://ifex-project.org/
 0000|1|(Local market)
 0B24|0|Bitcoin-24|bitcoin-24.com
 0BCE|0|BTC-E|btc-e.com
 0BCN|0|BTC China|btcchina.com
 0BCT|0|Bitcoin-Central|bitcoin-central.net
 0BCX|0|Bitcurex|bitcurex.com
 0BDE|0|bitcoin.de|bitcoin.de
 0BFL|0|Bitfloor|bitfloor.com
 0BME|0|Bitme|bitme.com
 0BMK|0|BitMarket.eu|bitmarket.eu
 0BNZ|0|bitNZ|bitnz.com
 0BTC|0|BTCX|btcx.com
 0BST|0|Bitstamp|bitstamp.net
 0CBX|0|Camp BX|campbx.com
 0CXC|0|Crypto X Change|cryptoxchange.com
 0ISG|0|Intersango|intersango.com
 0KPT|0|Kapiton|kapiton.se
 0MCD|0|Mercado|mercadobitcoin.com.br
 0MTG|0|MtGox|mtgox.com
 0KRK|0|Kraken|kraken.com
 0VCX|0|Vircurex|vircurex.com
 0VEX|0|VirtEx|cavirtex.com
 0VRW|0|Virwox|virwox.com
 
.bp

.MH 1 "Appendix C: Document History"
.in 3

draft-stanish-imic-00 (2012-11-13)
  - Update ABNF specification to respect case
  - Added more explicit human language description of code format
    (ie. explicit mention of code length and structure in English)
  - Added initial registry contents.

draft-imic-00 (2011-11-17)
  - Initial release.
