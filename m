From: James Bottomley <James.Bottomley@SteelEye.com>
Subject: Re: [parisc-linux] k-2.6.9-rc2-pa3 panic on c110 (ccio-dma or
	53c700 pb)
Date: 15 Sep 2004 19:08:27 -0400
Message-ID: <1095289712.2379.3.camel@mulgrave>
References: <4148773C.8040605@tiscali.be>
Mime-Version: 1.0
Content-Type: text/plain
Cc: PARISC list <parisc-linux@lists.parisc-linux.org>
To: Joel Soete <soete.joel@tiscali.be>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <4148773C.8040605@tiscali.be>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Wed, 2004-09-15 at 13:09, Joel Soete wrote:
> scsi1: (3:0), UNEXPECTED PHASE after command phase (CD BSY REQ CMD_OUT)
>           len = 6, cmd =scsi1 : destination target 3, lun 0
>          command = 0x2a 00 00 3e 7b 3c 00 00 28 00
> scsi1: Bus Reset detected, executing command 1c652ba0, slot 2fda8778, dsp 00128210[0210]

That's rather odd, the symptom is of an old bug, long fixed in the 2.6
kernel (namely 6 byte length for 10 byte command).  Where did you get
this kernel from?

James


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
