
import UserSettings from '@/components/user-settings'
import { currentUser } from '@/lib/custom-auth'

const SettingPage = async () => {
  const user = await currentUser()

  const content = (<UserSettings user={user!} />)


  return (
    <>
    {content}    
    </>
    
  )
}

export default SettingPage