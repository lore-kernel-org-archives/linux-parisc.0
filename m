From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] J5000 LED LCD patch (take 2)
Date: Sun, 27 Mar 2005 18:51:06 -0700
Message-ID: <20050328015106.GB30963@colo.lackof.org>
References: <200503241848.57598.dmp@davidmpye.dyndns.org>
	<20050327085330.GA17602@colo.lackof.org>
	<200503271038.42434.dmp@davidmpye.dyndns.org>
	<200503271855.56304.dmp@davidmpye.dyndns.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: David Pye <dmp@davidmpye.dyndns.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200503271855.56304.dmp@davidmpye.dyndns.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sun, Mar 27, 2005 at 05:55:53PM +0000, David Pye wrote:
> Could I ask you to have a glance at this patch? It's based on your previous 
> one, and only has a very minor change to the way count_HZ is incremented - ie 
> increment by the actual jiffies past, not the number we asked to be 
> rescheduled in.

Funny you point that out. I was thinking about it yesterday before I posted
the patch but was "too lazy" to figure out how to do it.

(TBH, I had several other things going on).

> On my system, the heart now beats regularly under IO/LAN traffic!

Cool!

> -	/* increment the local counters */
> -	++count;
> -	if (++count_HZ == HZ)
> +	/* increment the local counter */
> +	count_HZ += jiffies - last_jiffies;
> +	if (count_HZ >= HZ)
>  	    count_HZ = 0;
> -
> -	currentleds = lastleds;
> +	last_jiffies = jiffies;

Yeah, I'll add this bit, try it out and commit.

thanks,
grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
