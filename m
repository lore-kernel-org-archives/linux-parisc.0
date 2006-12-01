From: Joel Soete <soete.joel@scarlet.be>
Subject: Re: [parisc-linux] K410 SCSI 53c700 issue with PLEXTOR PX-R820T
Date: Fri, 01 Dec 2006 23:02:49 +0000
Message-ID: <4570B499.6040407__36253.5266824581$1416624624$gmane$org@scarlet.be>
References: <20061112160350.8b7d4afd.gmsoft@tuxicoman.be>	<20061112191436.GY16952@parisc-linux.org>	<20061127115832.b413fd7b.gmsoft@tuxicoman.be>	<20061127153713.GQ14076@parisc-linux.org>	<20061130101805.2a82273b.gmsoft@tuxicoman.be>	<1164907064.22826.23.camel@mulgrave.il.steeleye.com>	<1164910427.22826.37.camel@mulgrave.il.steeleye.com>	<20061130194830.90043d05.gmsoft@tuxicoman.be>	<45705108.3080500@scarlet.be>	<20061201161033.GO14076@parisc-linux.org>
	<4570AFC3.1050304@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1;
  format=flowed
Cc: Guy Martin <gmsoft@tuxicoman.be>,
 James Bottomley <James.Bottomley@SteelEye.com>,
 parisc-linux@parisc-linux.org,
 Matthew Wilcox <matthew@wil.cx>
To: Joel Soete <soete.joel@scarlet.be>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <4570AFC3.1050304@scarlet.be>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Sorry for this auto followup but during am i writing previous line I was testing a older vmlinux-2.6.16-pa10 and this pb was 
showing his face after a bit more then 30min of loop test:
scsi1: (3:0) phase mismatch at 01e8, phase IO CD MSG BSY REQ MSG IN
scsi1: Bus Reset detected, executing command 2ca36620, slot 2fd18520, dsp 001c81e8[01e8]
  failing command because of reset, slot 2fd18520, cmnd 2ca36620
  failing command because of reset, slot 2fd1864c, cmnd 2ca368e0
  failing command because of reset, slot 2fd18778, cmnd 2ca36200
  failing command because of reset, slot 2fd188a4, cmnd 149c6320

but:
   - one time (after about 45 min)
   - and the test can continue (while in 2.6.18-rc1-pa1 it finished always by panicing
     because ccio finished by being overloaded.

Joel



Joel Soete wrote:
> 
> 
> Matthew Wilcox wrote:
>> On Fri, Dec 01, 2006 at 03:58:00PM +0000, Joel Soete wrote:
>>> Sorry no yet a fix for my pb :_(
>>
>> It'd be useful to know if your problem was introduced at the same time.
>> Can you try the same git revisions that Guy tried and let us know if
>> that's the same commit that broke your machine?
>>
> mmm reading back this pr 
> <http://lists.parisc-linux.org/pipermail/parisc-linux/2006-July/029506.html> 
> 
> my pb seems to be already in early 2.6.18-rc1-pa1 and most probably in 
> 2.6.17 (according to my ps at this time).
> 
> Eventhought I have the filling that there was always pbs with this 
> driver on my c110 
> (<http://lists.parisc-linux.org/pipermail/parisc-linux/2004-September/024736.html>), 
> 
> I am ready to grab what Guy tried;
> may be can you send me the git cmdl parameters to grab exactely the same 
> stuff.
> 
> Joel
> 
> PS: the d380 I have for testing have to go back to production, sorry it 
> couldn't help us for a while :_(
> 
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
