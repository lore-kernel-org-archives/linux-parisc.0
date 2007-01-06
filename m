From: Joel Soete <soete.joel@scarlet.be>
Subject: Re: [parisc-linux] SCSI (?) bug
Date: Sat, 06 Jan 2007 15:53:28 +0000
Message-ID: <459FC5F8.2070607__9896.73521039567$1416624255$gmane$org@scarlet.be>
References: <7d01f9f00701060522p5b52fe47m290cad4fd0aadf1c@mail.gmail.com>	<1168096408.2792.46.camel@mulgrave.il.steeleye.com>
	<7d01f9f00701060727n421209a6q14c5f99ae798416e@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1;
  format=flowed
Cc: James Bottomley <James.Bottomley@steeleye.com>,
 parisc-linux <parisc-linux@lists.parisc-linux.org>
To: Thibaut VARENE <T-Bone@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <7d01f9f00701060727n421209a6q14c5f99ae798416e@mail.gmail.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Duno if it could help but latest git src (dated this 2007-01-03) boot fine on my d380 32bit smp system (only internal disk, 
i.e. ncr53c8xx driver only).

Otoh I was unable to boot smp 64bit (same src) on N4k: it hang after
NET: Registered protocol family 2

nosmp boot option solve the pb.

That said I also encountered the same symptome while trying to install opensuse 10.2 on an old smp i386 boxe, though.

Sorry but I couldn't help more for the moment.

Joel

Thibaut VARENE wrote:
> On 1/6/07, James Bottomley <James.Bottomley@steeleye.com> wrote:
>> On Sat, 2007-01-06 at 14:22 +0100, Thibaut VARENE wrote:
>> > So the scsi bug that struck Jeff, Kyle and myself on A500 eventually
>> > killed my rp3440. Here's the console dump:
>>
>> > http://www.pateam.org/archive/dumps/scsibug.txt
>>
>> The log isn't really helpful ... what ever caused this occurred just
>> prior to the first line (if it's captured in the log at all).
> 
> There was nothing prior to the first line (except the last normal
> dmesg output from boot time)
> 
>> > It basically renders SMP boxes useless. The last unaffected kernel was
>> > 2.6.18-rc1-pa3.
>>
>> The symptoms make it appear like a lost interrupt but there are many
>> other possibilities.
> 
> OK, thanks for the hint. It doesn't happen at all on UP machines, afaict.
> 
> T-Bone
> 
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
