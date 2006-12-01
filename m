From: Joel Soete <soete.joel@scarlet.be>
Subject: Re: [parisc-linux] K410 SCSI 53c700 issue with PLEXTOR PX-R820T
Date: Fri, 01 Dec 2006 15:58:00 +0000
Message-ID: <45705108.3080500__5993.85952014035$1416624626$gmane$org@scarlet.be>
References: <20061112160350.8b7d4afd.gmsoft@tuxicoman.be>	<20061112191436.GY16952@parisc-linux.org>	<20061127115832.b413fd7b.gmsoft@tuxicoman.be>	<20061127153713.GQ14076@parisc-linux.org>	<20061130101805.2a82273b.gmsoft@tuxicoman.be>	<1164907064.22826.23.camel@mulgrave.il.steeleye.com>	<1164910427.22826.37.camel@mulgrave.il.steeleye.com>
	<20061130194830.90043d05.gmsoft@tuxicoman.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1;
  format=flowed
Cc: James Bottomley <James.Bottomley@SteelEye.com>,
 parisc-linux@parisc-linux.org,
 Matthew Wilcox <matthew@wil.cx>
To: Guy Martin <gmsoft@tuxicoman.be>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20061130194830.90043d05.gmsoft@tuxicoman.be>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org



Guy Martin wrote:
> Hi James,
> 
> This is working fine ! Thanks a lot !
> 
> I was able to mount a cd without any pb.
> 
> Cheers,
>   Guy
> 
> On Thu, 30 Nov 2006 13:13:46 -0500
> James Bottomley <James.Bottomley@SteelEye.com> wrote:
> 
>> On Thu, 2006-11-30 at 12:17 -0500, James Bottomley wrote:
>>> And here we get a phase mismatch in the command phase because the drive
>>> transitions to data phase after six bytes and the driver still thinks it
>>> has another four to send.
>>>
>>> I'd have the maintainer shot ... he clearly forgot to set up the command
>>> length for auto request sense.
>> Try this and see if it fixes the problem
>>
>> James
> 
Sorry no yet a fix for my pb :_(
scsi1: (3:0) phase mismatch at 01e8, phase IO CD MSG BSY REQ MSG IN
scsi1: Bus Reset detected, executing command 15db93c0, slot 2ff48520, dsp 001c81e8[01e8]
  failing command because of reset, slot 2ff48520, cmnd 15db93c0
  failing command because of reset, slot 2ff4864c, cmnd 2feb03c0
  failing command because of reset, slot 2ff48778, cmnd 2feb0840
  failing command because of reset, slot 2ff488a4, cmnd 2feb0720

May be DEBUG will help too (but my c110 is naturally slow, so not sure, anyway I am trying)

Joel
anyway some progress has to be noticed: I can kill the process (Ctrl-C) and the system stay usable
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
> 
> 
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
