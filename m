Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Sat, 23 Aug 2003 13:28:34 -0600
From: Grant Grundler <grundler@parisc-linux.org>
To: Joel Soete <jsoe0708@tiscali.be>
Cc: Carlos O'Donell <carlos@baldric.uwo.ca>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Re: [parisc-linux-cvs] linux carlos
Message-ID: <20030823192834.GC5072@dsl2.external.hp.com>
References: <3F2E2C7700004A24@ocpmta2.freegates.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3F2E2C7700004A24@ocpmta2.freegates.net>
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

On Sat, Aug 23, 2003 at 04:54:26PM +0100, Joel Soete wrote:
> With the patch kernel I also want to launch 3 run test but with -e300 (Just
> have a N obviously UP 550Mhz?).

Pick whatever parameters are reasonable.
The -e100 to -e500 worked well on a dual 1Ghz rx2600 with 3 or 4 GB of RAM.
You might try -e50 -> -e250 in steps of 50....at least until the VM
address aliasing is fixed and you can run 8-way on the N-class.

> The first two run seems to work fine when during the last run I get a lot
> of messages "Child caught raw signal ?" and so I could not grab (cut and
> past) the first results :( .
> 
> I now relaunch test for only two runs and so hope the results for next week,
> sorry.

np - thanks.

grant
