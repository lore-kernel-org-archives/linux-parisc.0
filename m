From: Helge Deller <deller@gmx.de>
Subject: [parisc-linux] Re: broken keyboard driver on 2.6.3
Date: Sat, 6 Mar 2004 12:26:50 +0100
Message-ID: <200403061226.50883.deller__32761.6208502606$1416623240$gmane$org@gmx.de>
References: <Pine.LNX.4.21.0403051153090.23074-100000@hal.pp.fishpool.fi>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Cc: =?iso-8859-1?q?Martin-=C9ric_Racine?= <q-funk@pp.fishpool.fi>,
	debian-hppa@lists.debian.org
To: parisc-linux@lists.parisc-linux.org
Return-Path: <deller@gmx.de>
In-Reply-To: <Pine.LNX.4.21.0403051153090.23074-100000@hal.pp.fishpool.fi>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Friday 05 March 2004 10:58, Martin-Éric Racine wrote:
> One thing I noticed today, when using the 712 from the keyboard (which I almost
> never do), is that the cursor arrows near the keypad are broken:
> 
> In menuconfig, pressing any arrow kills the script with an abort message; in
> Nano, the keys are completely ignored.  However, 2.4.24-pa0 works as expected.

Hi Martin-Éric,

What does "showkey -s" reports if you press those keys ?
Could you mail me privately your bootlog ?

Helge
