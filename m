Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: Andy Walker <squawker@start.no>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Fast-Wide Diff. SCSI on a 735 
In-Reply-To: Message from Andy Walker <squawker@start.no>
   of "Thu, 30 May 2002 10:48:32 +0200." <1022748512.3cf5e760c85db@nyepost.start.no>
References: <200205291104.AA315359834@mail.centraltx.com> <20020529201334.8C23C482A@dsl2.external.hp.com> <1022707216.3cf54610c5ee8@nyepost.start.no> <20020530081452.GS3471@sleepie.demon.co.uk>  <1022748512.3cf5e760c85db@nyepost.start.no> 
Date: Thu, 30 May 2002 15:09:37 -0600
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020530210937.0FD4B482C@dsl2.external.hp.com>
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

Andy Walker wrote:
> If you remember Richard, I was having all sorts of trouble with a Bluefish
> card in a 725/100 a while back. Think I got the same results in a C110 too.

That certainly wasn't because of cache coherency support.
725/100 is not cache coherent. C110 is.

grant
