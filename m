From: Nicholas Leippe <nleippe@salesteamautomation.com>
Subject: Re: [parisc-linux] EVC to 2x VGA on ebay.
Date: Mon, 31 Jan 2005 11:32:25 -0700
Message-ID: <200501311132.25722.nleippe@salesteamautomation.com>
References: <20050131175635.GE29399@baldric.uwo.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050131175635.GE29399@baldric.uwo.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Monday 31 January 2005 10:56 am, Carlos O'Donell wrote:
> parisc,
>
> http://cgi.ebay.com/ws/eBayISAPI.dll?ViewItem&rd=1&item=5161476411&ssPageNa
>me=STRK:MEWA:IT

I would wait.  I just purchased some from this exact same vendor.  They did
not work exactly as I'd hoped.  He is trying to help me figure it out, since
he claims that several other buyers have had success.

The best I can get is RG output (no blue), and only on some of my monitors.

I beeped out the compelete pinout for these adapters.  The wiring of
an HP stock EVC-VGA adapter (which works on all of my monitors), and both 
connectors of these adapters is as follows: (reference: 
http://www.montest.com/technote.html)

            Goes to HP          Your VGA #1            Your VGA #2
VGA pin     EVC pin             goes to EVC:           goes to EVC:
-------     --------            ------------           ------------
1 Red       C1 Red              C1 Red                 1  TMDS DATA 2+
2 Green     C2 Green            C2 Green               14 TMDS CLK+
3 Blue      C4 Blue             C3 PX CLOCK OUT        22 TMDS DATA 0+
4 ID2       nc                  nc                     nc
5 GND Test  25 DDC RTN          9  1394 PAIR A, DATA   9  1394 PAIR A, DATA
6 GND       C5 Common GND RTN   C5 Common GND RTN      3  TMDS DATA 2 RTN
7 GND       C5 Common GND RTN   C5 Common GND RTN      25 DDC RTN
8 GND       C% Common GND RTN   C5 Common GND RTN      23 TMDS DATA 0 RTN
9 "nc"      28 +5 VDC           10 1394 PAIR A, DATA+  10 1894 PAIR A, DATA+
10 GND      4  SYNC RTN         C5 Common GND RTN      27 DDC CLK SCL
11 ID0      nc                  nc                     nc
12 ID1      nc                  nc                     nc
13 HS       5  HORIZ. SYNC TTL  C4 Blue                21 TMDS DATA 0
14 VS       6  VERT. SYNC TTL   24 STEREO SYNC TTL     2  TMDS DATA 2
15 ID3      27 DDC CLK SCL      29 1394 PAIR B, CLK+   19 1394 VG

As you can see from the pinouts, no matter what, there is no way to get
a complete VGA signal from either of the VGA connectors on the adapter.
This baffles me as to why anyone would manufacture an adapter with this
pinout.
 
It almost looks as if the #2 VGA connector was intended to drive a
DVI input--but it doesn't seem like it's quite there either.
Even between the two VGA connectors, there are no sync signals at
all--I'm not sure how exactly my monitor that can display this (minus
the blue, of course) is syncing the signal (possibly sync-on-green, 
but some of my monitors that don't work with these adapters accept 
sync-on-green as well).

-- 
Respectfully,

Nicholas Leippe
Sales Team Automation, LLC
1335 West 1650 North, Suite C
Springville, UT  84663 +1 801.853.4090
http://www.salesteamautomation.com
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
