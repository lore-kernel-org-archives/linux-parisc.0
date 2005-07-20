From: Matthew Wilcox <matthew@wil.cx>
Subject: Re: [parisc-linux] Machine hanging during high-traffic NFS
Date: Wed, 20 Jul 2005 15:56:52 +0100
Message-ID: <20050720145652.GN10156@parcelfarce.linux.theplanet.co.uk>
References: <200507200331.j6K3VD3v001086@hiauly1.hia.nrc.ca>
	<20050720035719.D16AD365915@mail.esiee.fr>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: Kyle McMartin <kyle@mcmartin.ca>,
 John David Anglin <dave@hiauly1.hia.nrc.ca>,
 parisc-linux@lists.parisc-linux.org
To: Thibaut VARENE <varenet@esiee.fr>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050720035719.D16AD365915@mail.esiee.fr>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Wed, Jul 20, 2005 at 05:57:19AM +0300, Thibaut VARENE wrote:
> I definitely concur on that. That's something I already suggested on
> IRC a while ago, and I believe that we probably all agree that there's
> such a need. The questions being how to do it properly (maitaining a
> separate "stable" branch is not absolutely trivial), and also *who* is
> going to maintain it.

I believe I said at the time that you were more than welcome to maintain
such a thing.  If you're just volunteering me to do more work ... sorry,
not interested.

> In any case, we really want to take time to fix our bugs. I don't know
> if we need to somehow "freeze" our tree to do that. I believe we sort
> of need that, since we keep injecting new bugs on top of mostly
> unknown existing ones involving and/or impacting many different
> subsystems.

Sounds good to me

> Maybe some sort of "puffinfest" would help cleaning up our kernel
> before the situation gets out of control.
> 
> I'd really wish we talk about that while at OLS, with the guys that
> are attending it ;)

We can certainly get together at some point ... this week's pretty busy though!

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
