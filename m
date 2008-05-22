From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: 2.6.26-rc3 64bit SMP does not boot on J5600
Date: Thu, 22 May 2008 15:23:50 -0400
Message-ID: <20080522192350.GA14976@phobos.i.cabal.ca>
References: <20080522161454.GA2873@ska.dandreoli.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.orgg
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20080522161454.GA2873@ska.dandreoli.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Thu, May 22, 2008 at 06:14:54PM +0200, Domenico Andreoli wrote:
> Hi,
> 
>   after the "1 CPU is stuck" problem, this is what my J5600 parisc
> prints at boot before hanging:
> 

I've got this fixed and cleaned up in my tree. We'll push it along
later, but for now, reverting bd3bb8c15b9a80dbddfb7905b237a4a11a4725b4
will be sufficient to get your machine booting again.

r, Kyle
