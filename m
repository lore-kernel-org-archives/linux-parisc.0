Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id AAA24019
	for <parisc-linux@puffin.external.hp.com>; Sat, 10 Jul 1999 00:46:56 -0600
Date: Sat, 10 Jul 1999 09:47:14 +0300 (EETDST)
From: Hannu Martikka <martikka@stybba.ntc.nokia.com>
To: Helge Deller <Helge.Deller@ruhr-uni-bochum.de>
cc: parisc-linux <parisc-linux@thepuffingroup.com>
In-Reply-To: <37867292.7463FE54@ruhr-uni-bochum.de>
Message-ID: <Pine.HPX.4.05.9907100900570.11988-200000@gamgee.ntc.nokia.com>
MIME-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="1418613302-851401618-931589234=:11988"
Subject: [parisc-linux] OS_ID and include/asm-parics/pdc.h
List-ID: <linux-parisc.vger.kernel.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.
  Send mail to mime@docserver.cac.washington.edu for more info.

--1418613302-851401618-931589234=:11988
Content-Type: TEXT/PLAIN; charset=ISO-8859-1
Content-Transfer-Encoding: 8BIT
Content-Transfer-Encoding: 8bit

Hi!

When reading the pdc.pdf document I noticed OS_ID field in Stable Storage
area. On page 2-65:
"The first halfword of the first OS Dependet are is used to store an
identifier caller OS_ID. OS-dependent use of Stable Stodare and
Non-Volatile Memory is qualified by OS_ID."

Then there is a list of OS_ID values "assigned by HP System Architecture
and Design Lab". 

On asm-parisc/pdc.h (from OSF) we have following:
#define OS_ID_NONE      0
#define OS_ID_HPUX      1
#define OS_ID_MPE_XL    2

On pdc.h we have more of these:
0x0003 	OSF dependent data
0x0004	HP-RT dependent data
0x0005	Novell Netware dependent data

I think we might require our own OS_ID (at least in futre) if we are
going to use that non-volatile memory for something. So maybe something
like this could be registered with HP (or is it already done?):

0x0006	Linux dependent data

There is also SW_CAP field (page 2-33 on pdc.pdf) which defines "the
operating system capabilities of the processor module". This array defines
only Novell, HP-RT, OSF, MPE and HP-UX fields (and couple of R(Reserved?) 
fields). Another guestion is that do we need this for anything?

- Goodi
"The linuX Files -- The Source is Out There."
ø,¸¸,ø¤º°`°º¤ø,¸¸,ø¤º°`°º¤ø,¸¸,ø¤º°`°º¤ø,¸¸,ø¤º°`°º¤ø¤º°`°º¤ø,¸¸,ø¤º°

--1418613302-851401618-931589234=:11988
Content-Type: TEXT/PLAIN; charset=US-ASCII; name="pdc.h_patch"
Content-Transfer-Encoding: BASE64
Content-ID: <Pine.HPX.4.05.9907100947140.11988@gamgee.ntc.nokia.com>
Content-Description: 
Content-Disposition: attachment; filename="pdc.h_patch"
Content-Transfer-Encoding: 8bit

KioqIHBkYy5oLm9saQlTYXQgSnVsIDEwIDA5OjQzOjIyIDE5OTkNCi0tLSBw
ZGMuaAlTYXQgSnVsIDEwIDA5OjQzOjA1IDE5OTkNCioqKioqKioqKioqKioq
Kg0KKioqIDI2MywyNjggKioqKg0KLS0tIDI2MywyNzIgLS0tLQ0KICAjZGVm
aW5lIE9TX0lEX05PTkUJMA0KICAjZGVmaW5lIE9TX0lEX0hQVVggCTENCiAg
I2RlZmluZSBPU19JRF9NUEVfWEwJMg0KKyAjZGVmaW5lIE9TX0lEX09TRgkz
DQorICNkZWZpbmUgT1NfSURfSFBfUlQJNA0KKyAjZGVmaW5lIE9TX0lEX05F
VFdBUkUJNQ0KKyAjZGVmaW5lIE9TX0lEX0xJTlVYCTYNCiAgc3RydWN0IHBk
Y19zeXNfbW9kZWwgeyAgLyogUERDX01PREVML1BEQ19NT0RFTF9TWVNfTU9E
RUwgKi8NCiAgCXVuc2lnbmVkIGludCAgIG1vZF9sZW47DQogIAlpbnQgICAg
IGZpbGxlclszMV07DQo=
--1418613302-851401618-931589234=:11988--
