From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux]      Heads up, 2.6.7-pa0 FTBS with 64-bit toolchain
Date: Wed, 23 Jun 2004 20:15:42 -0400 (EDT)
Message-ID: <200406240015.i5O0FgbE029552@hiauly1.hia.nrc.ca>
References: <40BD9F870000EA71@ocpmta2.freegates.net>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: soete.joel@tiscali.be (Joel Soete)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <40BD9F870000EA71@ocpmta2.freegates.net> from "Joel Soete" at Jun
	23, 2004 07:12:54 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> The build of the toolchain jsut failled as previously:
> <http://lists.parisc-linux.org/pipermail/parisc-linux/2004-April/022823.html>

Try

/CAD/parisc-linux/xc/bin/hppa-linux-gcc -print-file-name=libgcc.a
/CAD/parisc-linux/xc/bin/hppa-linux-gcc -print-file-name=libgcc_eh.a

This should show where thie compiler thinks libgcc.a and libgcc_eh.a
are.  You can see the full link command by adding "-Wl,-debug" to
the gcc command that failed.  GCC normally adds a "-L" option to the
directory where libgcc.a and libgcc_eh.a are installed.  If libgcc_eh.a
isn't there, you have a GCC build or install problem.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
