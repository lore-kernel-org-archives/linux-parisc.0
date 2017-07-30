From: John David Anglin <dave.anglin@bell.net>
Subject: Re: parisc 4.13-git, BUG: sleeping function called from invalid context at mm/slab.h:416
Date: Sun, 30 Jul 2017 15:27:18 -0400
Message-ID: <125F36DF-D194-442C-8B12-B51633C5955B@bell.net>
References: <alpine.LRH.2.20.1707292206210.12687@math.ut.ee> <CEB1A532-3AAD-4A4D-9A34-12A2477BE87F@bell.net> <alpine.LRH.2.20.1707300947250.27473@math.ut.ee> <F79536F1-AB2B-435C-A127-A1DFB4AC9CE0@bell.net> <1501428648.3670.1.camel@HansenPartnership.com> <alpine.LRH.2.20.1707302112140.27473@math.ut.ee> <15C99B92-DFB7-4B86-A280-2D491A5907CB@bell.net> <1501439838.3670.5.camel@HansenPartnership.com> <e8bc3427-c359-d15b-8aa2-8e39d971fa36@gmx.de>
Mime-Version: 1.0 (Apple Message framework v1085)
Content-Type: text/plain; charset=us-ascii
Cc: James Bottomley <James.Bottomley@HansenPartnership.com>,
        Meelis Roos <mroos@linux.ee>, linux-parisc@vger.kernel.org
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <e8bc3427-c359-d15b-8aa2-8e39d971fa36@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 2017-07-30, at 2:53 PM, Helge Deller wrote:

> On 30.07.2017 20:37, James Bottomley wrote:
>> On Sun, 2017-07-30 at 14:21 -0400, John David Anglin wrote:
>>> On 2017-07-30, at 2:12 PM, Meelis Roos wrote:
>>> 
>>>> 
>>>>> 
>>>>> How about this?  There's no need to take the write lock when
>>>>> creating
>>>>> links anyway.
>>>> 
>>>> No effect.
>>> 
>>> Is the backtrace still the same?
>> 
>> There's another write lock over a symlink in
>> pdcs_register_pathentries() does moving it up as well finally make this
>> go away (cumulative patch below).  If that doesn't work, enabling
>> DEBUG_PREEMPT might show which lock is the problem.
> 
> 
> That patch works.

Same here.

I noticed that when CONFIG_PDC_STABLE=m, it appears the PDC stable links are not setup.
The "PDC Stable Storage facility v0.30" message doesn't appear in the console output.

> 
> Helge
> 
>> diff --git a/drivers/parisc/pdc_stable.c b/drivers/parisc/pdc_stable.c
>> index 7147aa53e9a2..3e0c90420a1b 100644
>> --- a/drivers/parisc/pdc_stable.c
>> +++ b/drivers/parisc/pdc_stable.c
>> @@ -331,13 +331,13 @@ pdcspath_hwpath_write(struct pdcspath_entry *entry, const char *buf, size_t coun
>> 	/* Now, dive in. Write back to the hardware */
>> 	pdcspath_store(entry);
>> 	
>> +	write_unlock(&entry->rw_lock);
>> +
>> 	/* Update the symlink to the real device */
>> 	sysfs_remove_link(&entry->kobj, "device");
>> 	ret = sysfs_create_link(&entry->kobj, &entry->dev->kobj, "device");
>> 	WARN_ON(ret);
>> 
>> -	write_unlock(&entry->rw_lock);
>> -	
>> 	printk(KERN_INFO PDCS_PREFIX ": changed \"%s\" path to \"%s\"\n",
>> 		entry->name, buf);
>> 	
>> @@ -998,6 +998,7 @@ pdcs_register_pathentries(void)
>> 		/* kobject is now registered */
>> 		write_lock(&entry->rw_lock);
>> 		entry->ready = 2;
>> +		write_unlock(&entry->rw_lock);
>> 		
>> 		/* Add a nice symlink to the real device */
>> 		if (entry->dev) {
>> @@ -1005,7 +1006,6 @@ pdcs_register_pathentries(void)
>> 			WARN_ON(err);
>> 		}
>> 
>> -		write_unlock(&entry->rw_lock);
>> 		kobject_uevent(&entry->kobj, KOBJ_ADD);
>> 	}


Dave
--
John David Anglin	dave.anglin@bell.net



