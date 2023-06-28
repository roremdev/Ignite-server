import {
    CloudWatchLogsClient,
    PutLogEventsCommand,
} from '@aws-sdk/client-cloudwatch-logs'
import ErrorServer from '@controllers/ErrorServer.controller'

const client = new CloudWatchLogsClient({
    region: 'us-east-1',
    credentials: {
        accessKeyId: 'test',
        secretAccessKey: 'test',
    },
    endpoint: 'http://localhost:4566',
})

export const sendLogMessage = async (message: string) => {
    try {
        const command = new PutLogEventsCommand({
            logGroupName: 'server',
            logStreamName: 'development',
            logEvents: [
                {
                    message,
                    timestamp: new Date().getTime(),
                },
            ],
        })
        await client.send(command)
    } catch (error: any) {
        throw new ErrorServer('DRIVER', 'AWS CloudWatch client error')
    }
}
