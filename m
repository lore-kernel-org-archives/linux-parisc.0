From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: [parisc-linux] Call for Testing
Date: Wed, 30 Mar 2005 00:13:19 -0500
Message-ID: <20050330051319.GF24913@roadwarrior.mcmartin.ca>
References: <20050327204550.GC7728@roadwarrior.mcmartin.ca>
	<200503272308.32745.dmp@davidmpye.dyndns.org>
	<20050330030126.GN2485@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050330030126.GN2485@tausq.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Tue, Mar 29, 2005 at 07:01:26PM -0800, Randolph Chung wrote:
> Fixing this requires some work in binutils that nobody has been
> motivated enough to pursue yet.
> 
> Kyle, if there is enough interest in ipv6, is making it builtin an
> option?
> 

I don't think so... It only effects -32-smp, as far as I can tell
(by testing), which is very few machines that can't run -64-smp
instead.

At this late stage of the game, it would likely cause much more harm
than good to build it in.

Cheers,
-- 
Kyle McMartin
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
