Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Fri, 1 Aug 2003 17:44:07 -0600
From: Grant Grundler <grundler@parisc-linux.org>
To: Greg Anderson <greg@planetbeagle.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] How to install X on 715/50 -- problem with twm
Message-ID: <20030801234407.GB20826@dsl2.external.hp.com>
References: <20030801090533.GK727@sleepie.demon.co.uk> <5.2.1.1.2.20030731163951.00b423d0@127.0.0.1> <20030801090533.GK727@sleepie.demon.co.uk> <5.2.1.1.2.20030801102211.00b44308@127.0.0.1>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <5.2.1.1.2.20030801102211.00b44308@127.0.0.1>
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

On Fri, Aug 01, 2003 at 10:22:46AM -0700, Greg Anderson wrote:
> At 09:22 AM 8/1/2003 -0600, you wrote:
> >correct. For parisc, my preference is to run "sarge" since so much
> >stuff has been fixed since woody released.
> 
> Thanks for the reply.  Now can you tell me how to obtain "sarge."
> Geez, I really *am* a n00bie! ;-)

edit /etc/apt/sources.list and substitute "sarge" for "stable".

then
	apt-get update
	apt-get dist-upgrade

You might to learn how to run dselect and run that as well.
it seems to do a better job with dependencies.

grant
