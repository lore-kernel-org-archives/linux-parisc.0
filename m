Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from epirel991.europay.com (mail.europay.com [193.75.200.45])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4E55E482A
	for <parisc-linux@lists.parisc-linux.org>; Thu,  5 Jul 2001 07:44:59 -0600 (MDT)
Received: from mcnbru01 (unverified) by epirel991.europay.com
 (Content Technologies SMTPRS 4.1.5) with ESMTP id <Tac10592d54902946a7@epirel991.europay.com> for <parisc-linux@lists.parisc-linux.org>;
 Thu, 5 Jul 2001 15:44:37 +0200
Subject: Re: [parisc-linux] Re: How to access the second serial port on a B180 with
 PALINUX
To: "Thomas Bogendoerfer <tsbogend" <tsbogend%alpha.franken.de%SMTP%EUROPAY@mastercard.com>
Cc: parisc-linux@lists.parisc-linux.org
Message-ID: <OFF94FEB89.7C57D76A-ONC1256A80.004A71F2@LocalDomain>
From: "=?iso-8859-1?Q?Jo=EBl_Soete?=" <jso@europay.com>
Date: Thu, 5 Jul 2001 15:35:58 +0200
MIME-Version: 1.0
Content-type: multipart/mixed ; Boundary="0__=C1256A80004A71F28f9e8a93df938690918cC1256A80004A71F2"
List-ID: <linux-parisc.vger.kernel.org>

--0__=C1256A80004A71F28f9e8a93df938690918cC1256A80004A71F2
Content-type: text/plain; charset=iso-8859-1
Content-transfer-encoding: quoted-printable



Hi Thomas,

I also try X on my 712. I first install following packages:
ii  xbase-clients  4.0.3-4        miscellaneous X clients
ii  xfonts-100dpi  4.0.3-4        100 dpi fonts for X
ii  xfonts-75dpi   4.0.3-4        75 dpi fonts for X
ii  xfonts-base    4.0.3-4        standard fonts for X
ii  xfonts-cyrilli 4.0.3-4        Cyrillic fonts for X
ii  xfonts-pex     4.0.3-4        fonts for minimal PEX support in X
ii  xfonts-scalabl 4.0.3-4        scalable fonts for X
ii  xfree86-common 4.0.3-4        X Window System (XFree86) infrastructure
ii  xlibmesa3      4.0.3-4        XFree86 version of Mesa 3D graphics
library
ii  xlibs          4.0.3-4        X Window System client libraries
ii  xserver-common 4.0.3-4        files and utilities common to all X
servers
ii  xserver-xfree8 4.0.3-4        the XFree86 X server
ii  xutils         4.0.3-4        XFree86 utility programs

Then I install your XF86config and launch startx which failed (see
XFree86.0.log)
Also I try XFree86 -configure which failed also (see XFree86-configure)

And always same error: (EE) No OS PCI support available

Is it the actual cause of the failure.
Have you some work-around?

Thanks in advance for additional help,
     Joel


(See attached file: XFree86.0.log)(See attached file: XFree86-configure)



                                                                           =
                                      =20
                    Thomas                                                 =
                                      =20
                    Bogendoerfer             To:     Jo=EBl Soete/BRU/MASTE=
RCARD@MASTERCARD                        =20
                    <tsbogend@alpha.f        cc:     parisc-linux@lists.par=
isc-linux.org@SMTP@EUROPAY            =20
                    ranken.de>               Subject:     Re: [parisc-linux=
] Re: How to access the second serial =20
                                             port on a B180 with PALINUX   =
                                      =20
                    04-07-01 07:43 PM                                      =
                                      =20
                                                                           =
                                      =20
                                                                           =
                                      =20



On Wed, Jul 04, 2001 at 06:57:41PM +0200, Jo=EBl Soete wrote:
> Any idea about this keyboard problem?

I'm working on that problem, which I've noticed during the last weekend.
PS2 keyboard and mouse are working on my 712 but not on the B180.

Thomas.

--
Crap can work. Given enough thrust pigs will fly, but it's not necessary a
good idea.                                 [ Alexander Viro on linux-kernel
]



**********************************************************************
This e-mail and any attachments to it may contain confidential information =
which is strictly intended for the use of the authorised recipient.  If you=
 have received this e-mail in error, please delete it and notify the sender=
 by replying to this e-mail.
Thank you for your co-operation.
**********************************************************************

--0__=C1256A80004A71F28f9e8a93df938690918cC1256A80004A71F2
Content-type: application/octet-stream;
	name="=?iso-8859-1?Q?XFree86.0.log?="
Content-Disposition: attachment; filename="=?iso-8859-1?Q?XFree86.0.log?="
Content-transfer-encoding: base64

ClhGcmVlODYgVmVyc2lvbiA0LjAuMyAvIFggV2luZG93IFN5c3RlbQoocHJvdG9jb2wgVmVyc2lv
biAxMSwgcmV2aXNpb24gMCwgdmVuZG9yIHJlbGVhc2UgNjQwMCkKUmVsZWFzZSBEYXRlOiAxNiBN
YXJjaCAyMDAxCglJZiB0aGUgc2VydmVyIGlzIG9sZGVyIHRoYW4gNi0xMiBtb250aHMsIG9yIGlm
IHlvdXIgY2FyZCBpcwoJbmV3ZXIgdGhhbiB0aGUgYWJvdmUgZGF0ZSwgbG9vayBmb3IgYSBuZXdl
ciB2ZXJzaW9uIGJlZm9yZQoJcmVwb3J0aW5nIHByb2JsZW1zLiAgKFNlZSBodHRwOi8vd3d3LlhG
cmVlODYuT3JnL0ZBUSkKT3BlcmF0aW5nIFN5c3RlbTogTGludXggMi40LjAtcGExMCBwYXJpc2M2
NCBbRUxGXSAKKD09KSBMb2cgZmlsZTogIi92YXIvbG9nL1hGcmVlODYuMC5sb2ciLCBUaW1lOiBU
aHUgSnVsICA1IDExOjU0OjM3IDIwMDEKKD09KSBVc2luZyBjb25maWcgZmlsZTogIi9ldGMvWDEx
L1hGODZDb25maWciCk1hcmtlcnM6ICgtLSkgcHJvYmVkLCAoKiopIGZyb20gY29uZmlnIGZpbGUs
ICg9PSkgZGVmYXVsdCBzZXR0aW5nLAogICAgICAgICAoKyspIGZyb20gY29tbWFuZCBsaW5lLCAo
ISEpIG5vdGljZSwgKElJKSBpbmZvcm1hdGlvbmFsLAogICAgICAgICAoV1cpIHdhcm5pbmcsIChF
RSkgZXJyb3IsICg/PykgdW5rbm93bi4KKD09KSBTZXJ2ZXJMYXlvdXQgIlNpbXBsZSBMYXlvdXQi
CigqKikgfC0tPlNjcmVlbiAiU2NyZWVuIDEiICgwKQooKiopIHwgICB8LS0+TW9uaXRvciAibGNk
IgooKiopIHwgICB8LS0+RGV2aWNlICJmYmRldiIKKCoqKSB8LS0+SW5wdXQgRGV2aWNlICJNb3Vz
ZTEiCigqKikgfC0tPklucHV0IERldmljZSAiS2V5Ym9hcmQxIgooKiopIE9wdGlvbiAiQXV0b1Jl
cGVhdCIgIjUwMCAzMCIKKCoqKSBPcHRpb24gIlhrYlJ1bGVzIiAieGZyZWU4NiIKKCoqKSBYS0I6
IHJ1bGVzOiAieGZyZWU4NiIKKCoqKSBPcHRpb24gIlhrYk1vZGVsIiAicGMxMDEiCigqKikgWEtC
OiBtb2RlbDogInBjMTAxIgooKiopIE9wdGlvbiAiWGtiTGF5b3V0IiAidXMiCigqKikgWEtCOiBs
YXlvdXQ6ICJ1cyIKKCoqKSBGb250UGF0aCBzZXQgdG8gIi91c3IvWDExUjYvbGliL1gxMS9mb250
cy9taXNjLywvdXNyL1gxMVI2L2xpYi9YMTEvZm9udHMvNzVkcGkvOnVuc2NhbGVkLC91c3IvWDEx
UjYvbGliL1gxMS9mb250cy8xMDBkcGkvOnVuc2NhbGVkLC91c3IvWDExUjYvbGliL1gxMS9mb250
cy9UeXBlMS8sL3Vzci9YMTFSNi9saWIvWDExL2ZvbnRzL1NwZWVkby8sL3Vzci9YMTFSNi9saWIv
WDExL2ZvbnRzLzc1ZHBpLywvdXNyL1gxMVI2L2xpYi9YMTEvZm9udHMvMTAwZHBpLyIKKCoqKSBS
Z2JQYXRoIHNldCB0byAiL3Vzci9YMTFSNi9saWIvWDExL3JnYiIKKC0tKSB1c2luZyBWVCBudW1i
ZXIgNwoKKFdXKSBDYW5ub3Qgb3BlbiBBUE0KKEVFKSBObyBPUyBQQ0kgc3VwcG9ydCBhdmFpbGFi
bGUKKElJKSBBZGRyZXNzYWJsZSBidXMgcmVzb3VyY2UgcmFuZ2VzIGFyZQoJWzBdIC0xCTB4MDAw
MDAwMDAgLSAweGZmZmZmZmZmICgweDApIE1YW0JdCglbMV0gLTEJMHgwMDAwMDAwMCAtIDB4MDAw
MGZmZmYgKDB4MTAwMDApIElYW0JdCihJSSkgT1MtcmVwb3J0ZWQgcmVzb3VyY2UgcmFuZ2VzOgoo
SUkpIE9TLXJlcG9ydGVkIHJlc291cmNlIHJhbmdlcyBhZnRlciByZW1vdmluZyBvdmVybGFwcyB3
aXRoIFBDSToKKElJKSBBbGwgc3lzdGVtIHJlc291cmNlIHJhbmdlczoKKElJKSBNR0E6IGRyaXZl
ciBmb3IgTWF0cm94IGNoaXBzZXRzOiBtZ2EyMDY0dywgbWdhMTA2NHNnLCBtZ2EyMTY0dywKCW1n
YTIxNjR3IEFHUCwgbWdhZzEwMCwgbWdhZzEwMCBQQ0ksIG1nYWcyMDAsIG1nYWcyMDAgUENJLCBt
Z2FnNDAwCihJSSkgR0xJTlQ6IGRyaXZlciBmb3IgM0RsYWJzIGNoaXBzZXRzOiBnYW1tYSwgdGlf
cG0yLCB0aV9wbSwgcG0zLCBwbTJ2LAoJcG0yLCBwbSwgMzAwc3gsIDUwMHR4LCBteAoJUzNWSWRl
bnRpZnkKKElJKSBTM1ZJUkdFOiBkcml2ZXIgKHZlcnNpb24gMS42LjApIGZvciBTMyBWaVJHRSBj
aGlwc2V0czogdmlyZ2UsIDg2QzMyNSwKCXZpcmdlIHZ4LCA4NkM5ODgsIHZpcmdlIGR4LCB2aXJn
ZSBneCwgODZDMzc1LCA4NkMzODUsIHZpcmdlIGd4MiwKCTg2QzM1NywgdmlyZ2UgbXgsIDg2QzI2
MCwgdmlyZ2UgbXgrLCA4NkMyODAsIHRyaW8gM2QsIDg2QzM2NSwKCXRyaW8gM2QvMngsIDg2QzM2
MiwgODZDMzY4CihJSSkgU0lTOiBkcml2ZXIgZm9yIFNpUyBjaGlwc2V0czogU0lTNTU5NywgU0lT
NTU5OCwgU0lTNTMwLCBTSVM2MzI2LAoJU0lTMzAwLCBTSVM2MzAsIFNJUzU0MAooSUkpIFNBVkFH
RTogZHJpdmVyICh2ZXJzaW9uIDEuMS4wIGZvciBTMyBTYXZhZ2UgY2hpcHNldHM6IFNhdmFnZTQs
CglTYXZhZ2UzRCwgU2F2YWdlM0QtTVYsIFNhdmFnZTIwMDAsIFNhdmFnZS9NWC1NViwgU2F2YWdl
L01YLAoJU2F2YWdlL0lYLU1WLCBTYXZhZ2UvSVgsIFByb1NhdmFnZSBQTTEzMywgUHJvU2F2YWdl
IEtNMTMzCihJSSkgVFJJREVOVDogZHJpdmVyIGZvciBUcmlkZW50IGNoaXBzZXRzOiB0dmdhODkw
MGQsIGN5YmVyOTMyMCwgY3liZXI5Mzg4LAoJY3liZXI5Mzk3LCBjeWJlcjkzOTdkdmQsIGN5YmVy
OTUyMCwgY3liZXI5NTI1ZHZkLCBjeWJlcmJsYWRlL2U0LAoJdGd1aTk0MjBkZ2ksIHRndWk5NDQw
YWdpLCB0Z3VpOTY2MCwgdGd1aTk2ODAsIHByb3ZpZGlhOTY4MiwKCXByb3ZpZGlhOTY4NSwgY3li
ZXI5MzgyLCBjeWJlcjkzODUsIDNkaW1hZ2U5NzUsIDNkaW1hZ2U5ODUsIGJsYWRlM2QsCgljeWJl
cmJsYWRlaTcsIGN5YmVyYmxhZGVpN2QsIGN5YmVyYmxhZGVpMSwgY3liZXJibGFkZWkxZCwKCWN5
YmVyYmxhZGVBaTEsIGN5YmVyYmxhZGVBaTFkCihJSSkgQ0hJUFM6IERyaXZlciBmb3IgQ2hpcHMg
YW5kIFRlY2hub2xvZ2llcyBjaGlwc2V0czogY3Q2NTUyMCwgY3Q2NTUyNSwKCWN0NjU1MzAsIGN0
NjU1MzUsIGN0NjU1NDAsIGN0NjU1NDUsIGN0NjU1NDYsIGN0NjU1NDgsIGN0NjU1NTAsCgljdDY1
NTU0LCBjdDY1NTU1LCBjdDY4NTU0LCBjdDY5MDAwLCBjdDY5MDMwLCBjdDY0MjAwLCBjdDY0MzAw
CihJSSkgRkJEZXY6IGRyaXZlciBmb3IgZnJhbWVidWZmZXI6IGZiZGV2LCBhZmIKKElJKSBBVEk6
IEFUSSBkcml2ZXIgKHZlcnNpb24gNi4yLjMpIGZvciBjaGlwc2V0czogYXRpCihJSSkgUjEyODog
RHJpdmVyIGZvciBBVEkgUmFnZSAxMjggY2hpcHNldHM6IEFUSSBSYWdlIDEyOCBSRSAoUENJKSwK
CUFUSSBSYWdlIDEyOCBSRiAoQUdQKSwgQVRJIFJhZ2UgMTI4IFJHIChBR1ApLCBBVEkgUmFnZSAx
MjggUksgKFBDSSksCglBVEkgUmFnZSAxMjggUkwgKEFHUCksIEFUSSBSYWdlIDEyOCBQcm8gUEQg
KEFHUCksCglBVEkgUmFnZSAxMjggUHJvIFBGIChBR1ApLCBBVEkgUmFnZSAxMjggTW9iaWxpdHkg
TEUgKFBDSSksCglBVEkgUmFnZSAxMjggTW9iaWxpdHkgTEYgKEFHUCksIEFUSSBSYWdlIDEyOCBN
b2JpbGl0eSBNRiAoQUdQKSwKCUFUSSBSYWdlIDEyOCBNb2JpbGl0eSBNTCAoQUdQKQooSUkpIFJB
REVPTjogRHJpdmVyIGZvciBBVEkgUmFkZW9uIGNoaXBzZXRzOiBBVEkgUmFkZW9uIFFEIChBR1Ap
LAoJQVRJIFJhZGVvbiBRRSAoQUdQKSwgQVRJIFJhZGVvbiBRRiAoQUdQKSwgQVRJIFJhZGVvbiBR
RyAoQUdQKQooSUkpIFZHQTogR2VuZXJpYyBWR0EgZHJpdmVyICh2ZXJzaW9uIDQuMCkgZm9yIGNo
aXBzZXRzOiBnZW5lcmljCihJSSkgdjRsIGRyaXZlciBmb3IgVmlkZW80TGludXgKCVMzVlByb2Jl
IGJlZ2luCihJSSkgRkJEZXYoMCk6IHVzaW5nIGRlZmF1bHQgZGV2aWNlCihJSSkgUnVubmluZyBp
biBGUkFNRUJVRkZFUiBNb2RlCigqKikgRkJEZXYoMCk6IERlcHRoIDgsICgtLSkgZnJhbWVidWZm
ZXIgYnBwIDgKKD09KSBGQkRldigwKTogRGVmYXVsdCB2aXN1YWwgaXMgUHNldWRvQ29sb3IKKD09
KSBGQkRldigwKTogVXNpbmcgZ2FtbWEgY29ycmVjdGlvbiAoMS4wLCAxLjAsIDEuMCkKKElJKSBG
QkRldigwKTogSGFyZHdhcmU6IHN0aWZiICh2aWRtZW06IDIwNDhrKQooPT0pIEZCRGV2KDApOiBP
cHRpb24gU2hhZG93RkIgaXMgb24KKElJKSBGQkRldigwKTogQ2hlY2tpbmcgTW9kZXMgYWdhaW5z
dCBmcmFtZWJ1ZmZlciBkZXZpY2UuLi4KKElJKSBGQkRldigwKTogCW1vZGUgIjY0MHg0ODAiIG9r
CihJSSkgRkJEZXYoMCk6IENoZWNraW5nIE1vZGVzIGFnYWluc3QgbW9uaXRvci4uLgooLS0pIEZC
RGV2KDApOiBWaXJ0dWFsIHNpemUgaXMgNjQweDQ4MCAocGl0Y2ggNjQwKQooKiopIEZCRGV2KDAp
OiBEZWZhdWx0IG1vZGUgIjY0MHg0ODAiOiAyNS4yIE1IeiAoc2NhbGVkIGZyb20gMC4wIE1Ieiks
IDMxLjUga0h6LCA2MC4wIEh6CigrKykgRkJEZXYoMCk6IERQSSBzZXQgdG8gKDEwMCwgMTAwKQoo
PT0pIEZCRGV2KDApOiBCYWNraW5nIHN0b3JlIGRpc2FibGVkClBFWEV4dGVuc2lvbkluaXQ6IENv
dWxkbid0IG9wZW4gZGVmYXVsdCBQRVggZm9udCBmaWxlICBSb21hbl9NCigqKikgT3B0aW9uICJQ
cm90b2NvbCIgIlBTLzIiCigqKikgTW91c2UxOiBQcm90b2NvbDogIlBTLzIiCigqKikgT3B0aW9u
ICJDb3JlUG9pbnRlciIKKCoqKSBNb3VzZTE6IENvcmUgUG9pbnRlcgooKiopIE9wdGlvbiAiRGV2
aWNlIiAiL2Rldi9tb3VzZSIKKD09KSBNb3VzZTE6IEJ1dHRvbnM6IDMKKElJKSBLZXlib2FyZCAi
S2V5Ym9hcmQxIiBoYW5kbGVkIGJ5IGxlZ2FjeSBkcml2ZXIKKElJKSBYSU5QVVQ6IEFkZGluZyBl
eHRlbmRlZCBpbnB1dCBkZXZpY2UgIk1vdXNlMSIgKHR5cGU6IE1PVVNFKQo=

--0__=C1256A80004A71F28f9e8a93df938690918cC1256A80004A71F2
Content-type: application/octet-stream;
	name="=?iso-8859-1?Q?XFree86-configure?="
Content-Disposition: attachment; filename="=?iso-8859-1?Q?XFree86-configure?="
Content-transfer-encoding: base64

ClhGcmVlODYgVmVyc2lvbiA0LjAuMyAvIFggV2luZG93IFN5c3RlbQoocHJvdG9jb2wgVmVyc2lv
biAxMSwgcmV2aXNpb24gMCwgdmVuZG9yIHJlbGVhc2UgNjQwMCkKUmVsZWFzZSBEYXRlOiAxNiBN
YXJjaCAyMDAxCglJZiB0aGUgc2VydmVyIGlzIG9sZGVyIHRoYW4gNi0xMiBtb250aHMsIG9yIGlm
IHlvdXIgY2FyZCBpcwoJbmV3ZXIgdGhhbiB0aGUgYWJvdmUgZGF0ZSwgbG9vayBmb3IgYSBuZXdl
ciB2ZXJzaW9uIGJlZm9yZQoJcmVwb3J0aW5nIHByb2JsZW1zLiAgKFNlZSBodHRwOi8vd3d3LlhG
cmVlODYuT3JnL0ZBUSkKT3BlcmF0aW5nIFN5c3RlbTogTGludXggMi40LjAtcGExMCBwYXJpc2M2
NCBbRUxGXSAKKD09KSBMb2cgZmlsZTogIi92YXIvbG9nL1hGcmVlODYuMC5sb2ciLCBUaW1lOiBU
aHUgSnVsICA1IDExOjUxOjQwIDIwMDEKKC0tKSB1c2luZyBWVCBudW1iZXIgNwoKKEVFKSBObyBP
UyBQQ0kgc3VwcG9ydCBhdmFpbGFibGUKTGlzdCBvZiB2aWRlbyBkcml2ZXJzOgoJbWdhCglnbGlu
dAoJczN2aXJnZQoJc2lzCglzYXZhZ2UKCXRyaWRlbnQKCWNoaXBzCglmYmRldgoJYXRpCgl2Z2EK
CXY0bAooSUkpIHY0bCBkcml2ZXIgZm9yIFZpZGVvNExpbnV4Ck5vIGRldmljZXMgdG8gY29uZmln
dXJlLiAgQ29uZmlndXJhdGlvbiBmYWlsZWQuCg==

--0__=C1256A80004A71F28f9e8a93df938690918cC1256A80004A71F2--
