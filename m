From: Kyle McMartin <kyle@parisc-linux.org>
Subject: Re: [parisc-linux] [PATCH] shmat() and CONFIG_STACK_GROWSUP
Date: Thu, 11 Jan 2007 14:42:08 -0500
Message-ID: <20070111194208.GB3699__44802.2375036546$1416624261$gmane$org@athena.road.mcmartin.ca>
References: <200701112015.58821.deller@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200701112015.58821.deller@gmx.de>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Thu, Jan 11, 2007 at 08:15:58PM +0100, Helge Deller wrote:
> I think this patch for the shmat() is obviously correct for our stack (which grows up).
> Basically we gain a small region of 4 Pages in which shmat() may map memory.
> 
> Ok ?
> If yes, should I commit or send to linux-kernel mailing list ?
> 

The latter please, I don't feel comfortable merging such things before they
have had discussion somewhere. You can commit it too, but please make sure it
gets sent to linux-kernel.

Thanks,
	Kyle
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
