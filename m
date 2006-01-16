From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: [parisc-linux] __LP64__ / CONFIG_64BIT?
Date: Mon, 16 Jan 2006 11:40:54 -0500
Message-ID: <20060116164054.GB4049@quicksilver.road.mcmartin.ca>
References: <43CA9FF8.5070405@tiscali.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Joel Soete <soete.joel@tiscali.be>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <43CA9FF8.5070405@tiscali.be>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sun, Jan 15, 2006 at 07:18:16PM +0000, Joel Soete wrote:
> Hello *,
> 
> Could we move all #ifdef __LP64__ to CONFIG_64BIT?
>

Er, why? One of them is shorter to write, and makes the
same amount of sense... I have no particularly preference at any
rate. In fact, using __LP64__ might be preferable, as CONFIG_64BIT
requires us including <linux/config.h> which means any change
to the config will cause this file to be rebuilt whether or not
it is actually required. Then again, it's entirely possible
my understanding of this config crap is antiquated.

Cheers,
	Kyle 
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
