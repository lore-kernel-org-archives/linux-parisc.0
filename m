Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: Carlos O'Donell <carlos@baldric.uwo.ca>,
	parisc-linux@lists.parisc-linux.org
In-Reply-To: Message from Carlos O'Donell <carlos@baldric.uwo.ca>
   of "Sun, 20 Oct 2002 01:26:23 EDT." <20021020052623.GA1577@systemhalted>
References: <20021020052623.GA1577@systemhalted> 
Date: Sun, 20 Oct 2002 17:37:10 -0600
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20021020233710.A78BA4829@dsl2.external.hp.com>
Subject: [parisc-linux] Re: GSP on A500 - Level 14 Alert - Output overvoltage?
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

Carlos O'Donell wrote:
...
> SOURCE DETAIL: 4 = high voltage DC power   SOURCE ID: FF
> PROBLEM DETAIL: 5 = output overvoltage

this would suggest your site has a voltage regulation problem.
you might get out a DVM and see if that's a persistent problem.

> Is this bad for my hardware :}

I'd think yes. normally the power supplies are designed to handle
something like 5-10% input power variation.

>   The system did not respond to the Power-On command.
>   Turn the system power switch Off and On again to reset the system.

I'd unplug the power too just to be sure it's really reset.

grant
