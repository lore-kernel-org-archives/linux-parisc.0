From: Matthew Wilcox <matthew@wil.cx>
Subject: Re: [parisc-linux] [testers wanted] cleanup early console setup
Date: Mon, 14 Feb 2005 14:26:42 +0000
Message-ID: <20050214142642.GD29917@parcelfarce.linux.theplanet.co.uk>
References: <20050211223525.GH2277@tausq.org>
	<20050214021236.GA29917@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Matthew Wilcox <matthew@wil.cx>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050214021236.GA29917@parcelfarce.linux.theplanet.co.uk>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Mon, Feb 14, 2005 at 02:12:36AM +0000, Matthew Wilcox wrote:
> On Fri, Feb 11, 2005 at 02:35:25PM -0800, Randolph Chung wrote:
> > Especially interesting would be something that uses non-8250 consoles,
> > such as E/K class systems that use the serial mux console. I suspect
> > some changes are needed there. If you can test on such a system, and see
> > some problems [*], please let me know. likely we will need to move the
> > register_console() call from mux_probe() into a separate initcall.
> > 
> > [*] during startup, the console print messages should show up regularly,
> > and only once. symptoms of problems are if your console prints pause
> > for a long time, or if you start seeing each line printed twice.

I'm not sure we can avoid the long pauses.  Look at what happens:

> Switching from PDC console
> Console: colour dummy device 160x64

The console starts up and disables the early console, using the dummy driver.
Then we wait while we do a buswalk ...

> Serial mux driver (8 ports) Revision: 0.3
> ttyB0 at MMIO 0xf1900800 (polled) is a Mux

... and eventually the mux driver gets registered and starts spewing
everything out.

So there's still a long period of time during which we have no console
driver registered and it's frequently the most interesting part from
the point of view of drivers or devices having trouble ;-(

Based on this, CON_BOOT seems like a superior solution.  That's annoying.

-- 
"Next the statesmen will invent cheap lies, putting the blame upon 
the nation that is attacked, and every man will be glad of those
conscience-soothing falsities, and will diligently study them, and refuse
to examine any refutations of them; and thus he will by and by convince 
himself that the war is just, and will thank God for the better sleep 
he enjoys after this process of grotesque self-deception." -- Mark Twain
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
