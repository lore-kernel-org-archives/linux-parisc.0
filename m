From: Christoph Hellwig <hch@lst.de>
Subject: Re: [parisc-linux] syscall number for vserver
Date: Thu, 18 Dec 2003 08:25:06 +0100
Message-ID: <20031218072506.GA8142__36849.889640189$1416623063$gmane$org@lst.de>
References: <20031217221618.GC9313@MAIL.13thfloor.at>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: parisc-linux@lists.parisc-linux.org,
	vserver@list.linux-vserver.org
Return-Path: <hch@lst.de>
In-Reply-To: <20031217221618.GC9313@MAIL.13thfloor.at>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Wed, Dec 17, 2003 at 11:16:18PM +0100, Herbert Poetzl wrote:
> 
> Hi everyone!
> 
> I would like to 'officially' reserve a syscall number
> for parisc(64)/vserver ... 

The syscall is the typical multiplexer crap, so an actual submission
wouldn't have any chance.  Please fix up your junk beofe trying to
play the reserve a syscall scheme.  This didn't work for afs or
LSM either.
