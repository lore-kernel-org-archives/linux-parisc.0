From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] [RFC] Reorder compat structure placement and
	casting (firmware.c)?
Date: Thu, 5 Aug 2004 22:33:33 -0600
Message-ID: <20040806043333.GG20367@colo.lackof.org>
References: <20040801045032.GE31520@baldric.uwo.ca>
	<20040802052751.GD20904@colo.lackof.org>
	<20040805040600.GA21912@baldric.uwo.ca>
	<20040805205937.GB20367@colo.lackof.org>
	<20040806035128.GE2672@baldric.uwo.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Carlos O'Donell <carlos@baldric.uwo.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20040806035128.GE2672@baldric.uwo.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Thu, Aug 05, 2004 at 11:51:28PM -0400, Carlos O'Donell wrote:
> I don't exclude making narrow calls from a wide kernel.

ok

> How about something like this? It's actually cleaner to add more
> assembly labels.

Yes - that's basically what I initially had hacked up but
didn't test since I saw you had an alternative posted already.

The only possible problem with multiple labels is gcc won't know
the two labels are aliases. See my previous posting
on this thread. But I don't know if it's really a problem at all
or just an overly active imagination.

grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
