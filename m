Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Sat, 23 Aug 2003 00:26:12 -0600
From: Grant Grundler <grundler@parisc-linux.org>
To: dann frazier <dannf@hp.com>
Cc: ??????? ??????? <almetoil@tatneft.ru>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Re: palo
Message-ID: <20030823062612.GB20379@dsl2.external.hp.com>
References: <1245099799.20030822174107@tatneft.ru> <20030822160820.GA18112@ldl.fc.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030822160820.GA18112@ldl.fc.hp.com>
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

On Fri, Aug 22, 2003 at 10:08:20AM -0600, dann frazier wrote:
> you have e-mailed the admin of the cvs list, which is part of the old bug
> tracking system.
> i've cc'd the parisc-linux list, which is probably the best place to ask.

thanks dann

> On Fri, Aug 22, 2003 at 05:41:07PM +0400, ??????? ??????? wrote:
> > ???????????? ?????????, cvs-admin.
> > 
> >   Please help me cvs download palo !
> >   Please sorry my english
> > 
> >   I am use this and read error messges:
> >     user@panda:~/palo$ cvs -d :pserver:guest@cvs.parisc-linux.org:/ checkout palo
> >     cvs checkout: warning: failed to open /home/user/.cvspass for reading: No such file or directory

try "cvs -d ... login" first.
Just hit <CR> (aka return or enter key) for password prompt.

grant
