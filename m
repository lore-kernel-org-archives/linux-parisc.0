Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mr3.ipartners.pl (mr3.ipartners.pl [157.25.5.21])
	by dsl2.external.hp.com (Postfix) with ESMTP id 76E904892
	for <parisc-linux@lists.parisc-linux.org>; Wed, 15 Oct 2003 12:25:52 -0600 (MDT)
Date: Wed, 15 Oct 2003 20:21:35 +0200 (CEST)
From: Tomasz Hinzmann <hinzen@blah.pl>
Reply-To: hinzen@blah.pl
To: Joel Soete <soete.joel@tiscali.be>
Cc: parisc-linux@lists.parisc-linux.org
Subject: RE: [parisc-linux] ATI rage xl and C360 (it works!)
In-Reply-To: <3F8A29A2000018C3@ocpmta1.freegates.net>
Message-ID: <Pine.LNX.4.10.10310151939440.181-102000@headcount.blah.pl>
MIME-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="57786536-2133366339-1066241952=:181"
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

--57786536-2133366339-1066241952=:181
Content-Type: TEXT/PLAIN; CHARSET=US-ASCII
Content-ID: <Pine.LNX.4.10.10310152021161.181@headcount.blah.pl>


On Wed, 15 Oct 2003, Joel Soete wrote:

> Sorry but on the b180L on wich card is pluged in, i boot a kernel with module
> support and build the new atyfb module and when I modprobe it the system
> crash (without oops message :( ).
> The only message I got is:
> atyfb: using auxiliary register aperture
> atyfb: 3D RAGE (XL PCI-33MHz) [0x4752 rev 0x27] 8M WRAM, 14.31818 MHz XTAL,
> 230K
> 
> which seems more relevant then previous test (with original atyfb support).

Hi Joel,
this is what I read when I modprobe the driver:

...
bigmama:~# modprobe atyfb
atyfb: using auxiliary register aperture
atyfb: 3D RAGE (XL PCI-33MHz) [0x4752 rev 0x27] 8M WRAM, 14.31818 MHz XTAL, 230
MHz PLL, 83 Mhz MCLK, 63 Mhz XCLK
Console: switching to colour frame buffer device 80x30
fb0: ATY Mach64 frame buffer device on PCI
bigmama:~# 
...

I also run a kernel with the driver built-in and it behaves fine.

> Never the less, I would like very much that it works and so ask you the favor
> to send me your .config file to be sure I do not lost anything :) (btw with
> your XF86Config-4 :) )

Please find both configs attached; I hope they'll be helpful.

Thanks,
t.

-- 
hinzen@blah.pl

--57786536-2133366339-1066241952=:181
Content-Type: APPLICATION/OCTET-STREAM; NAME="XF86Config-4.gz"
Content-Transfer-Encoding: BASE64
Content-ID: <Pine.LNX.4.10.10310152019120.181@headcount.blah.pl>
Content-Description: XFConfig-4.gz
Content-Disposition: ATTACHMENT; FILENAME="XF86Config-4.gz"

H4sICOxxjT8AA1hGODZDb25maWctNACtV1tzmzgUfsa/4gx+2O00xmBzs192
Wl9qT5s0W2ezeRUg2xpjxIBw7Pz6PQIMOMVN29nM4EE6F33fd44k0u124ePs
0/IOprOPk693c1jNJg/Lr3edLjzNXXvCozXb9Ez482meUOrakNLkQBPwc0OW
EMF4BGsW0newoRHFCRqAd4KAHqXPDYgtxWRT6jESwRNMLgIF5+ENZCmLNnAg
YUZTWCd8L4MwgyczQEAE8UhKtU4XE80CJtDM0nxReGZiCz7JZLYbIFGAAGke
fgF/T6KMhBCTjUwDfz6cYgrqXiJquKlARB6bbmmI3ogkFtq7fN3lGk48g2cS
CfmCCmxJtEG8gjfgxAnNBbqUgEfhCSHs6DkI83l0zZMCqdq9VgUVQhZRIB4/
0JxdnydA1gILUMiah87uplcCPRry50K3B14uLtFGmzRXjkUXSqfUL3RMssLg
8z1qFIwxHiCId5teQs+Vp3AseqF3XOetgU4khYRzoQF8CFOel0Jd8GcIOCyB
BAH4WSqwvOVCuXjkrFOv6p+L5gOkfFFLKfRfKiD2fpYm/XRLEtoPuN8vcfQk
ah715x/+1jYvWqezKlYDdY6RqdpRunMeiXsitooq/LhvjAaaYbvaUDMMZ+wY
uq4qitKFkPvYM2v0LbseI4Gtc2W+s8EWyWPHeCHdpzfwjOJhd60J9pFH/B3w
XNGUdpR68Rx/yLz+k2H0Za60v2epr77h458SFobsTT8kEsSsP86iFMHS4C1/
x/old7mHjLecVjGlAf85pD+FT+3MoqCsaKO0tzzIQooZvnASKOqnLz7urmro
MbEncTUMvNoUBH79nrDqnR7FngfVULaWQMLVxCY8Vu8sEoZejWJ6tKqB3C9J
nSY9y1EMRSlhMTo0YB0ZvcJ0GcWZmNID86X3MqCRYGtGEyQt9w/z4TM9eZzk
q04Thr2pKOqunvsay0Q4N0GJPrfMP+28b5ncKQij2FKvrCg2DdEa+4ZuvrJ9
IXg6CjRm6S8TON8NeHze8iylTQL7cuIC/T1H6WnSnC4T41s/oId+nJLs2LTf
J1xwn4fS437VH/y2ym8jXNEokChnB4yWaookoz/AyuSaeAL49Brg5f4HkH+I
9pEFlMPkVVesPVy3udg/KZ1/xERysQLtld0WMcGTq8qcrQuesJfVKfKVod4z
hnpHeaSJ+Eaxq9KtYuGcrTf1uL9dqZ2OIvsLVNvUj6Yu9xUAfkCMYWBphuXA
7eLlBhZjGBqaadqwk8PHMdgjzXVGsHiR/lMuJnhE74oYV04tHtg+v/gwL9i2
CY6tg6vr0vZ4tuF6+IzANAwwrdw2Dwka8E/tLSQVFV8eixeQwP4lSYSxYzh/
IQWcptEfeC9kccwTAcT3adhRUEjJ68zO0Afm0bHdnF5J0HE1xxpWBG1d0wdW
RdCxNH1oSIIyII+qaOaRZm2oyMpl8AcpG8bQBmNoDGqvijbiwGcEjjPIJak8
avLvz+TfF+S/J2RYg6Nr43lQReekRoY2Gug1KbxrdbdZteHIaieVRxptpHAp
MAaYBjnhj+nqLaQQCz4WuA4+I6uN1P9b0YGrH6XerxUwhqbmurUEzkgb6Y26
mtrIctslKEJbNcDVpBmra1pYWNt1WzQoy49dhD+olG7bP1Pc39Oh9ahY+Rgb
vToppnRNslBAZSzOLuXKeVUeKErbEVOmmtIYvxoGZkdZZV59JLI0DskJ3ZTC
Iffo5gVLMV19xNRzjY1Zz1W93XSs6y0lqNe9IkT+mVhej+1yVMZCF6VFqMa9
1HrhX9i/v0+77QlKaxN3txbx21LylrQV7B/8zr/wa/8HpPMfpgxpvloOAAA=
--57786536-2133366339-1066241952=:181
Content-Type: APPLICATION/OCTET-STREAM; NAME="config-2.4.22-pa12.gz"
Content-Transfer-Encoding: BASE64
Content-ID: <Pine.LNX.4.10.10310152019121.181@headcount.blah.pl>
Content-Description: config-2.4.22-pa12.gz
Content-Disposition: ATTACHMENT; FILENAME="config-2.4.22-pa12.gz"

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
--57786536-2133366339-1066241952=:181--
