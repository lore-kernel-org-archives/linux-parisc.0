From: Stuart Brady <sdbrady@ntlworld.com>
Subject: [parisc-linux] Console/X problems on HCRX-24
Date: Tue, 15 Nov 2005 19:59:18 +0000
Message-ID: <20051115195918.GA5640@ntlworld.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
To: parisc-linux@lists.parisc-linux.org,
 Johannes Raspe <j.raspe@t-online.de>,
 Andy Walker <ajwalker@broadpark.no>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Hi,

Firstly, I've just found that my HCRX-24 works with an LCD monitor.
This was news to me, as IIRC it had even failed to work with monitors
that claimed to support sync-on-green.  I hope that might help someone.

Secondly, I can confirm several problems reported by Johannes Raspe and
Andy Walker late last year:

1) The Tux colours are wrong.  I'll try to expand on that later.

2) The console colours aren't right... actually, the 'normal' colours
   work correctly, but the 'bright' colours are all white.  (Even bright
   black).  Switching to/from X seems to fix this.

3) X doesn't work properly in 32-bit mode.  It appears as though the X
   server is using 24-bit pixels, but the HCRX-24 card is expecting
   8-bits of padding per pixel...  So something like this:

   HCRX-24: R G B U|R G B U|R G B U|...
   X:       R G B|R G B|R G B|R G B|...

   That's consistent with the colour 'artefacts' that I'm seeing.  BTW,
   the right 1/4 of the screen is just whatever was left in the console
   before switching to X.  I'll have a look at this one, but I expect
   it's a bug in our STI code. :-(

Cheers,
-- 
Stuart Brady
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
