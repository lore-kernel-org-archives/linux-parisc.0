Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: Richard Hirst <rhirst@linuxcare.com>
Cc: Vlad Markov <markov@monmouth.com>,
	parisc-linux@lists.parisc-linux.org
In-Reply-To: Message from Richard Hirst <rhirst@linuxcare.com>
   of "Fri, 25 Jan 2002 09:57:55 GMT." <20020125095755.GH32617@sleepie.demon.co.uk>
References: <200201240200.VAA00858@monmouth.com> <20020125065501.A6537482A@dsl2.external.hp.com>  <20020125095755.GH32617@sleepie.demon.co.uk> 
Date: Fri, 25 Jan 2002 22:28:33 -0700
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020126052834.1F31C482A@dsl2.external.hp.com>
Subject: [parisc-linux] Re: tag starvation
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

Richard Hirst wrote:
> I used to get this a lot, until James changed the driver to only report
> the first occurance of it.  Don't remember the exact details, but iirc
> it is for info only, and non-fatal.  From the code it looks like it
> means some cmnd has been sitting in the drive unprocessed for too long,
> and the code rejects new cmds until those older ones have been processed
> or timed out.

Ah ok...does "starvation" properly described by the following scenario?

While the drive is completing IO requests as fast as it can,
*some* IO's don't complete because they never become the most
optimal one to complete. This is an inherent "unfairness"
in the normal SCSI  Queue tag. (Two other types of tags exist but
are never used by Unix OS's AFAICT: ordered, Head)

HP branded (and tested) drives are required to return a completion
for any outstanding IO within 3 seconds. ie if 8 tags are active
any given time, the drive can complete the IO's in any order until
an IO reaches this 3 second limit. The reason for the limit is
to prevent outstanding file system meta data from locking up access
to portions the file system for 30+ seconds.

> Hmm, I thought that would be a feature of a specific driver, not the
> upper layers.  53c700.c doesn't (yet) have any boot options to disable
> tags.

hmmm...could we just replace the following constant with
a MODULE_PARAM() variable?

53c700.h:#define NCR_700_MAX_TAGS               16

In the interim, I suggest reducing this until the problem
goes away for that disk.

IIRC, HPUX allows the user to set this on a per disk basis
using scsictl command.

thanks,
grant
