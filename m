From: John David Anglin <dave.anglin@bell.net>
Subject: Re: Aw: Re:  Re: Re: HP c8000 linux install issues, troubles and questions
Date: Sat, 2 Apr 2016 17:48:25 -0400
Message-ID: <E1592B17-FA77-42CC-A08F-331C63DE3408@bell.net>
References: <CACrbsaC7KnupAXvon-PRWTXnAZ13Hb5Xmc3364aVivY4HGCC6Q@mail.gmail.com> <4207644.uZSTasQYhb@caliban.sf-tec.de> <trinity-a1bc4683-085f-4f5b-870e-03082f9b89ba-1459237701367@3capp-gmx-bs02> <CACrbsaC_gOAmUixFoE+rXf-TFT0P6VEEDT-2txig09QgzC6iOQ@mail.gmail.com> <trinity-d7ee1960-e99b-416c-bd06-9a3e7bf998bc-1459245685774@3capp-gmx-bs62> <56FA7786.6070100@gmx.de> <56FA77FB.6090406@gmx.de>, <CACrbsaD5qP5e99=47j4E+-vq0V1DKDytqzHVakHeH7DJ_-K+5w@mail.gmail.com> <trinity-13a381d1-e1fb-42af-8cd9-4197fe95fdfd-1459331985395@3capp-gmx-bs41>
Mime-Version: 1.0 (Apple Message framework v1085)
Content-Type: text/plain; charset=us-ascii
Cc: "Simone Mannori" <simone.mannori@gmail.com>,
	"Rolf Eike Beer" <eike-kernel@sf-tec.de>,
	linux-parisc@vger.kernel.org
To: "Helge Deller" <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <trinity-13a381d1-e1fb-42af-8cd9-4197fe95fdfd-1459331985395@3capp-gmx-bs41>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 2016-03-30, at 5:59 AM, Helge Deller wrote:

>> Now, I'm fighting with a very hardware issue: the screws of the PA
>> CPUs are non standard hex with a center pin. I hate this things.
>> Yesterday evening I was ready to upgrade from a single PA-8800/900 MHz
>> to a dual PA-8900/1GHz 
> 
> I'm not sure if this will simply work. I was looking at the idea myself
> once, and googling for that it seems that some firmware update needs to
> be done in order for the machine to accept the additional CPU.
> If you do it, please let us know...

I had to replace cpu in my rp3440.  I asked vendor if it would be possible to increase speed
from 800 MHz and they said no.  I think it's possible to add a second cpu but don't have any
personal experience.  The machine did run with one cpu module.

The screws are a pain...

Dave
--
John David Anglin	dave.anglin@bell.net



