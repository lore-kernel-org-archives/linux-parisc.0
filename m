From: Joel Soete <soete.joel@tiscali.be>
Subject: Re: copy_user_page_asm suggested 64bit improvment [Was: [parisc-linux]
	clear user page test]
Date: Mon, 27 Dec 2004 17:34:27 +0000
Message-ID: <41D047A3.4030205@tiscali.be>
References: <418A80E8000124B5@mail-6-bnl.tiscali.it>	<20041227073654.GI29492@colo.lackof.org>
	<41CFE6B1.6010707@tiscali.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii;
  format=flowed
Cc: parisc-linux <parisc-linux@lists.parisc-linux.org>
To: Joel Soete <soete.joel@tiscali.be>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <41CFE6B1.6010707@tiscali.be>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org



Joel Soete wrote:
> 
> 
> Grant Grundler wrote:
> 
>> On Tue, Dec 21, 2004 at 02:37:47PM +0100, Joel Soete wrote:
>>
[...]
>>> * with original 2.6.10-rc3-pa8 running kernel
>>> # grep "^user" k-loop1
>>
>>
>> Please use "^sys" or "^real".
>> "user" time is only number that should NOT change with this patch.
>>
> I will try to recover those info
> 
Those results was:
k-loop1 (i.e. cvs 2.6.10-rc3-pa8)
real	23m7.594s
user	18m47.768s
sys	4m2.585s

real	22m53.506s
user	18m47.400s
sys	4m0.321s

real	22m54.599s
user	18m47.492s
sys	4m0.226s

real	22m53.410s
user	18m48.205s
sys	3m59.351s

k-loop2 (i.e. cvs 2.6.10-rc3-pa8 + patch without pdtlb)
real	23m4.170s
user	18m47.511s
sys	4m0.654s

real	22m59.651s
user	18m51.133s
sys	3m58.969s

real	23m0.391s
user	18m50.908s
sys	3m59.588s

real	22m59.401s
user	18m51.090s
sys	3m59.673s

k-loop3 (i.e. cvs 2.6.10-rc3-pa8 + full patch)
real	23m28.521s
user	18m53.815s
sys	3m57.967s

real	23m32.696s
user	18m54.045s
sys	3m58.598s

real	23m28.981s
user	18m54.774s
sys	3m58.128s

real	23m30.631s
user	18m54.405s
sys	3m58.974s


hth,
	Joel
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
