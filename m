Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from csmail.ucc.ie (csmail.ucc.ie [143.239.211.231])
	by dsl2.external.hp.com (Postfix) with ESMTP id D026F485E
	for <parisc-linux@lists.parisc-linux.org>; Wed, 16 Apr 2003 06:37:11 -0600 (MDT)
Date: Wed, 16 Apr 2003 13:37:08 +0100 (IST)
From: "M. Grabert" <xam@cs.ucc.ie>
To: Matthew Wilcox <willy@debian.org>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Presicionbook success
In-Reply-To: <20030416122948.GM30643@parcelfarce.linux.theplanet.co.uk>
Message-ID: <Pine.LNX.4.44.0304161331520.28370-300000@sal.ucc.ie>
MIME-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="-275789367-807845364-1050496628=:28370"
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.
  Send mail to mime@docserver.cac.washington.edu for more info.

---275789367-807845364-1050496628=:28370
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Wed, 16 Apr 2003, Matthew Wilcox wrote:

> On Wed, Apr 16, 2003 at 01:07:06PM +0100, M. Grabert wrote:
> > I just wanted you to inform that I successfully installed
> > Debian testing on my Presicionbook.
>
> Sweet!
>
> >   (The Presicionbook uses 2.5" IDE harddrives, obviously connected
> >    to the CMD chip, but they automagically appear as SCSI drives on LASI
> >    SCSI.)
>
> *blink*.  That's pretty weird.  Could you send the device listing that
> dmesg produces, and the results of lspci?

Attached to this mail ;)

NB. dmesg output running linux-2.4.20-pa32 WITHOUT IDE support!
    And I was using lspci -vvv

> I'm a little confused; I've got both 16 and 32 bit cards here and I
> don't see any physical difference between the cards that'd prevent a
> 32-bit card being inserted into a slot.  Yes, gold vs silver colouring;
> some bumps on the 32-bit card (could that be it?)

Exactly! Unfortunately you can't use 32bit Cardbus PC Cards in 16bit
PCMCIA ISA slots :-(


greetings, Max

---275789367-807845364-1050496628=:28370
Content-Type: TEXT/plain; name="dmesg.txt"
Content-Transfer-Encoding: BASE64
Content-ID: <Pine.LNX.4.44.0304161337080.28370@sal.ucc.ie>
Content-Description: dmesg
Content-Disposition: attachment; filename="dmesg.txt"

PGh0bWw+DQoNCjxoZWFkPg0KPHRpdGxlPldlYkNvbSAyIEhRPC90aXRsZT4N
CjwvaGVhZD4NCg0KPGJvZHkgYmdjb2xvcj0id2hpdGUiPg0KPHRhYmxlIGFs
aWduPSJjZW50ZXIiIGJnY29sb3I9IndoaXRlIiB3aWR0aD0iNjAwIj48dHI+
PHRkPg0KDQo8IS0tIFRpdGxlIC0tPg0KPGNlbnRlcj4NCjxpbWcgc3JjPSJp
bWFnZXMvdGl0bGVpbWcucG5nIiBhbHQ9IldlYkNvbSAyIEhRIiB3aWR0aD0i
NTI4IiBoZWlnaHQ9IjExMyI+DQo8YnIgY2xlYXI9ImxlZnQiPg0KPGZvbnQg
c2l6ZT0iMyI+PGI+RGV2ZWxvcG1lbnQgU2VydmVyIGZvciB0aGUgV2ViQ29t
IDIgUHJvamVjdDwvYj48L2ZvbnQ+DQo8YnI+PGJyPjxicj48YnI+DQo8L2Nl
bnRlcj4NCg0KPCEtLSBXYXJuaW5nIC0tPg0KPHRhYmxlIGJnY29sb3I9IkU1
RTVFNSIgd2lkdGg9IjEwMCUiIGNlbGxzcGFjaW5nPSIwIj48dHI+DQoJPHRk
IGJnY29sb3I9IkU1RTVFNSIgd2lkdGg9IjQ4Ij4NCgkJPGltZyBzcmM9Imlt
YWdlcy93YXJuaW5nLnBuZyIgYWx0PSJXYXJuaW5nISINCgkJCWFsaWduPSJs
ZWZ0IiB3aWR0aD0iNDgiIGhlaWdodD0iNDgiPg0KCTwvdGQ+DQoJPHRkIGJn
Y29sb3I9IkU1RTVFNSI+DQoJPGZvbnQgc2l6ZT0iMiI+PGI+V2FybmluZyE8
L2I+PC9mb250Pjxicj4NCgk8Zm9udCBzaXplPSIxIj4NCglJZiB5b3UgYXJl
IG5vdCBhIFdlYkNvbSAyIGRldmVsb3BlciB5b3Ugc2hvdWxkIG5vdCBiZSBy
ZWFkaW5nIHRoaXMgcGFnZS4NCglBbGwgaW5mb3JtYXRpb24gb24gdGhpcyBz
ZXJ2ZXIgaXMgcHJvcHJpZXR5IHRvIHRoZSBDZW50cmUgRm9yIFVuaWZpZWQN
CglDb21wdXRpbmcsIENvcmssIElyZWxhbmQuDQoJVW5sZXNzIHlvdSBoYXZl
IHdyaXR0ZW4gcGVybWlzc2lvbiBmcm9tIGEgQ1VDIG1lbWJlciB0byB2aXNp
dCB0aGlzIHNpdGUsDQoJbGVhdmUgbm93Lg0KCTwvZm9udD4NCgk8L3RkPg0K
PC90cj48L3RhYmxlPg0KPGJyIGNsZWFyPSJsZWZ0Ij48YnI+PGJyPg0KDQo8
IS0tIENvbnRlbnRzIC0tPg0KPHRhYmxlIHdpZHRoPSIxMDAlIiBiZ2NvbG9y
PSIjODZDOEY5Ij48dHI+PHRkPg0KPGZvbnQgc2l6ZT0iMyI+PGI+Q29udGVu
dHM8L2I+PC9mb250Pg0KPC90ZD48L3RyPjwvdGFibGU+DQo8dWw+DQoJPGxp
Pg0KCQk8YSBocmVmPSIvY2dpLWJpbi92aWV3Y3ZzLmNnaSI+VmlldyBDVlMg
UmVwb3NpdG9yeTwvYT4NCgk8L2xpPg0KCTxsaT4NCgkJPGEgaHJlZj0ibHhy
L3NvdXJjZSI+QnJvd3NlIFNvdXJjZSBDb2RlPC9hPg0KCTwvbGk+DQoJPGxp
Pg0KCQk8YSBocmVmPSJqYXZhZG9jLmh0bWwiPkphdmFEb2NzPC9hPg0KCTwv
bGk+DQogICAgPGxpPg0KICAgICAgICA8YSBocmVmPSJzdGF0cy5odG1sIj5D
VlMgU3RhdGlzdGljczwvYT4NCiAgICA8L2xpPg0KICAgIDxsaT4NCiAgICAg
ICAgPGEgaHJlZj0ibWFpbG1hbi9saXN0aW5mbyI+IENWUyBNYWlsaW5nIExp
c3RzIDwvYT4NCiAgICA8L2xpPg0KICAgIDxsaT4NCiAgICAgICAgPGEgaHJl
Zj0iL3VzYWdlIj5TZXJ2ZXIgVXNhZ2UgU3RhdGlzdGljczwvYT4NCiAgICA8
L2xpPg0KCTxsaT4NCgkJPGEgaHJlZj0ibWVtYmVycy5odG1sIj5Hcm91cCBN
ZW1iZXJzPC9hPg0KCTwvbGk+DQoJPGxpPg0KCQk8YSBocmVmPSJsaW5rcy5o
dG1sIj5MaW5rczwvYT4NCgk8L2xpPg0KCTxsaT4NCgkJPGEgaHJlZj0icGFz
c3dvcmQuaHRtbCI+Q2hhbmdlIFBhc3N3b3JkczwvYT4NCgk8L2xpPg0KPC91
bD4NCjxicj4NCg0KPCEtLSBGb290ZXIgLS0+DQo8aHIgd2lkdGg9IjEwMCUi
Pg0KPGNlbnRlcj4NCjxmb250IHNpemU9IjEiPiZjb3B5OyBDZW50cmUgRm9y
IFVuaWZpZWQgQ29tcHV0aW5nIDIwMDI8L2ZvbnQ+DQo8L2NlbnRlcj4NCg0K
PC90ZD48L3RyPjwvdGFibGU+DQo8L2JvZHk+DQo8L2h0bWw+DQo=
---275789367-807845364-1050496628=:28370
Content-Type: TEXT/plain; name="lspci.txt"
Content-Transfer-Encoding: BASE64
Content-ID: <Pine.LNX.4.44.0304161337081.28370@sal.ucc.ie>
Content-Description: lspci
Content-Disposition: attachment; filename="lspci.txt"

MDA6MDEuMCBJREUgaW50ZXJmYWNlOiBDTUQgVGVjaG5vbG9neSBJbmMgUENJ
MDY0MyAocHJvZy1pZiA4YSBbTWFzdGVyIFNlY1AgUHJpUF0pDQoJQ29udHJv
bDogSS9PKyBNZW0tIEJ1c01hc3Rlci0gU3BlY0N5Y2xlLSBNZW1XSU5WLSBW
R0FTbm9vcC0gUGFyRXJyKyBTdGVwcGluZy0gU0VSUi0gRmFzdEIyQi0NCglT
dGF0dXM6IENhcC0gNjZNaHotIFVERi0gRmFzdEIyQisgUGFyRXJyLSBERVZT
RUw9bWVkaXVtID5UQWJvcnQtIDxUQWJvcnQtIDxNQWJvcnQtID5TRVJSLSA8
UEVSUi0NCglJbnRlcnJ1cHQ6IHBpbiBBIHJvdXRlZCB0byBJUlEgOTcNCglS
ZWdpb24gMDogSS9PIHBvcnRzIGF0IDAxZjAgW3NpemU9MTZdDQoJUmVnaW9u
IDE6IEkvTyBwb3J0cyBhdCAwM2Y0IFtzaXplPTRdDQoJUmVnaW9uIDI6IEkv
TyBwb3J0cyBhdCAwMTcwIFtzaXplPTE2XQ0KCVJlZ2lvbiAzOiBJL08gcG9y
dHMgYXQgMDM3NCBbc2l6ZT00XQ0KCVJlZ2lvbiA0OiBJL08gcG9ydHMgYXQg
ZmYwMCBbc2l6ZT0xNl0NCg0KMDA6MDIuMCBDYXJkQnVzIGJyaWRnZTogQ2ly
cnVzIExvZ2ljIFBEIDY4MzIgUENNQ0lBL0NhcmRCdXMgQ3RybHIgKHJldiBj
MSkNCglDb250cm9sOiBJL08tIE1lbS0gQnVzTWFzdGVyLSBTcGVjQ3ljbGUt
IE1lbVdJTlYtIFZHQVNub29wLSBQYXJFcnIrIFN0ZXBwaW5nLSBTRVJSKyBG
YXN0QjJCLQ0KCVN0YXR1czogQ2FwLSA2Nk1oei0gVURGLSBGYXN0QjJCLSBQ
YXJFcnItIERFVlNFTD1tZWRpdW0gPlRBYm9ydC0gPFRBYm9ydC0gPE1BYm9y
dC0gPlNFUlItIDxQRVJSLQ0KCUludGVycnVwdDogcGluIEEgcm91dGVkIHRv
IElSUSA5OA0KCVJlZ2lvbiAwOiBNZW1vcnkgYXQgZjBmZmUwMDAgKDMyLWJp
dCwgbm9uLXByZWZldGNoYWJsZSkgW2Rpc2FibGVkXSBbc2l6ZT00S10NCglC
dXM6IHByaW1hcnk9MDAsIHNlY29uZGFyeT0wMSwgc3Vib3JkaW5hdGU9MDQs
IHNlYy1sYXRlbmN5PTANCglNZW1vcnkgd2luZG93IDA6IGZmZmZmMDAwLTAw
MDAwMDAwIFtkaXNhYmxlZF0NCglNZW1vcnkgd2luZG93IDE6IGZmZmZmMDAw
LTAwMDAwMDAwIFtkaXNhYmxlZF0NCglJL08gd2luZG93IDA6IDAwMDBmZmZj
LTAwMDAwMDAzIFtkaXNhYmxlZF0NCglJL08gd2luZG93IDE6IDAwMDBmZmZj
LTAwMDAwMDAzIFtkaXNhYmxlZF0NCglCcmlkZ2VDdGw6IFBhcml0eS0gU0VS
Ui0gSVNBLSBWR0EtIE1BYm9ydC0gPlJlc2V0KyAxNmJJbnQtIFBvc3RXcml0
ZS0NCgkxNi1iaXQgbGVnYWN5IGludGVyZmFjZSBwb3J0cyBhdCAwMDAxDQoN
CjAwOjAyLjEgQ2FyZEJ1cyBicmlkZ2U6IENpcnJ1cyBMb2dpYyBQRCA2ODMy
IFBDTUNJQS9DYXJkQnVzIEN0cmxyIChyZXYgYzEpDQoJQ29udHJvbDogSS9P
LSBNZW0tIEJ1c01hc3Rlci0gU3BlY0N5Y2xlLSBNZW1XSU5WLSBWR0FTbm9v
cC0gUGFyRXJyKyBTdGVwcGluZy0gU0VSUisgRmFzdEIyQi0NCglTdGF0dXM6
IENhcC0gNjZNaHotIFVERi0gRmFzdEIyQi0gUGFyRXJyLSBERVZTRUw9bWVk
aXVtID5UQWJvcnQtIDxUQWJvcnQtIDxNQWJvcnQtID5TRVJSLSA8UEVSUi0N
CglJbnRlcnJ1cHQ6IHBpbiBCIHJvdXRlZCB0byBJUlEgOTkNCglSZWdpb24g
MDogTWVtb3J5IGF0IGYwZmZmMDAwICgzMi1iaXQsIG5vbi1wcmVmZXRjaGFi
bGUpIFtkaXNhYmxlZF0gW3NpemU9NEtdDQoJQnVzOiBwcmltYXJ5PTAwLCBz
ZWNvbmRhcnk9MDUsIHN1Ym9yZGluYXRlPTA4LCBzZWMtbGF0ZW5jeT0wDQoJ
TWVtb3J5IHdpbmRvdyAwOiBmZmZmZjAwMC0wMDAwMDAwMCBbZGlzYWJsZWRd
DQoJTWVtb3J5IHdpbmRvdyAxOiBmZmZmZjAwMC0wMDAwMDAwMCBbZGlzYWJs
ZWRdDQoJSS9PIHdpbmRvdyAwOiAwMDAwZmZmYy0wMDAwMDAwMyBbZGlzYWJs
ZWRdDQoJSS9PIHdpbmRvdyAxOiAwMDAwZmZmYy0wMDAwMDAwMyBbZGlzYWJs
ZWRdDQoJQnJpZGdlQ3RsOiBQYXJpdHktIFNFUlItIElTQS0gVkdBLSBNQWJv
cnQtID5SZXNldCsgMTZiSW50LSBQb3N0V3JpdGUtDQoNCg==
---275789367-807845364-1050496628=:28370--
