From: James Bottomley <James.Bottomley@SteelEye.com>
Subject: Re: [parisc-linux] How to set Command Queue Depth?
Date: 10 Aug 2004 15:49:11 -0500
Message-ID: <1092170956.1727.44.camel@mulgrave>
References: <411924BB.2010408@hrzpub.tu-darmstadt.de>
Mime-Version: 1.0
Content-Type: text/plain
Cc: PARISC list <parisc-linux@lists.parisc-linux.org>
To: Ruediger Scholz <rscholz@hrzpub.tu-darmstadt.de>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <411924BB.2010408@hrzpub.tu-darmstadt.de>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Tue, 2004-08-10 at 14:40, Ruediger Scholz wrote:
> I have to install debian onto a new hard disc due to a head crash. I've 
> downloaded the new debian-installer (rc1), but when debian-installer is 
> formatting partitions my machine hangs saying "(scsi drive) is suffering 
> from tag starvation". I know this problem from running 2.4-kernels. 
> Normally I would change the queue depth to 1 in 53c7xx.h, but this is no 
> solution for the debian-installer...
> 
> So, is there a possibility to set the depth of the tag command queue of 
> the lasi Controller during run-time? I tried to use
>                 echo "settags all 1" > /proc/scsi/lasi700/0
> but this command never returns back to command prompt.
> Or can I use some kernel parameters during boot?
> And the last question: Is there a install image using a 2.6 kernel?

The required command is

echo 1 > /sys/bus/scsi/devices/<root device>/queue_depth

James


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
