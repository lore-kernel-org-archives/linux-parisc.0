From: Julian Stecklina <der_julian@web.de>
Subject: Re: [parisc-linux] Sound problems on a C3600
Date: Tue, 08 May 2007 15:13:20 +0200
Message-ID: <46407770.3040302__1720.02374097264$1416624352$gmane$org@web.de>
References: <462A3C0D.8090004@web.de>	
	<7d01f9f00704212103q1c6f8d42lc275946dceb8a893@mail.gmail.com>	
	<463F732D.6050904@web.de>
	<7d01f9f00705071531n6d5d045i365ddeb2074c6e5f@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=UTF-8;
  format=flowed
Cc: parisc-linux@lists.parisc-linux.org
To: Thibaut VARENE <T-Bone@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <7d01f9f00705071531n6d5d045i365ddeb2074c6e5f@mail.gmail.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Thibaut VARENE wrote:
> On 5/7/07, Julian Stecklina <der_julian@web.de> wrote:
>> Tests done using the onboard AD1889 without any .asoundrc:
>>
>>  > mplayer -ao oss ...
>> ...
>> AO: [oss] 44100Hz 2ch s16be (2 bytes per sample)
>> ...
>> Works!
> 
> Expected
> 
>>  > mplayer -ao alsa ...
>>
>> Doesn't work, noise. (Endian problem? Mplayer's fault?)
> 
> Expected

Why is that?

> If by 'signaling issue' you mean the random crash when doing ctrl-C, I
> don't know if it's fixed. The best way to check is to try ;)

My kernel crashes. :-/

Regards,
Julian
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
